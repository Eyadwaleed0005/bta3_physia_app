import 'dart:async';

import 'package:bta3_physia/features/exams/data/models/exam_question_model.dart';
import 'package:bta3_physia/features/exams/data/models/exams_model.dart';
import 'package:bta3_physia/features/exams/presentation/cubit/exam_solve_state.dart';
import 'package:bta3_physia/features/results/data/models/exam_result_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamSolveCubit extends Cubit<ExamSolveState> {
  ExamSolveCubit({ExamSolveViewMode viewMode = ExamSolveViewMode.starting})
    : _remainingController = StreamController<Duration>.broadcast(
        sync: true,
        onListen: () {},
      ),
      super(ExamSolveState(viewMode: viewMode));

  final StreamController<Duration> _remainingController;

  Stream<Duration> get remainingStream => _remainingController.stream;

  Duration get remaining => _currentRemaining;

  Timer? _ticker;
  Timer? _transition;
  bool _isOnline = true;

  void startAttempt({ExamsModel? exam}) {
    _ticker?.cancel();
    _transition?.cancel();

    final durationInMinutes = _durationFromExam(exam) ?? 60;
    final initialDuration = Duration(minutes: durationInMinutes);

    _currentRemaining = initialDuration;
    _remainingController.add(initialDuration);

    emit(
      ExamSolveState(
        examTitle: exam?.title ?? state.examTitle,
        viewMode: ExamSolveViewMode.starting,
        questions: ExamQuestionModel.defaultQuestions(),
      ),
    );

    _transition = Timer(const Duration(milliseconds: 800), () {
      if (isClosed) return;
      emit(state.copyWith(viewMode: ExamSolveViewMode.solving));
      _startTicker();
    });
  }

  void setViewMode(ExamSolveViewMode mode) {
    _ticker?.cancel();
    _transition?.cancel();
    emit(state.copyWith(viewMode: mode));
  }

  void selectAnswer(int answerIndex) {
    if (state.viewMode != ExamSolveViewMode.solving) return;

    final question = state.currentQuestion;
    if (question == null) return;

    final updatedQuestions = [...state.questions];
    updatedQuestions[state.currentIndex] = question.copyWith(
      selectedAnswerIndex: answerIndex,
    );

    emit(state.copyWith(questions: updatedQuestions));
  }

  void nextQuestion() {
    if (state.isLastQuestion) return;
    emit(state.copyWith(currentIndex: state.currentIndex + 1));
  }

  void previousQuestion() {
    if (state.isFirstQuestion) return;
    emit(state.copyWith(currentIndex: state.currentIndex - 1));
  }

  void goToQuestion(int index) {
    if (index < 0 || index >= state.totalQuestions) return;
    emit(state.copyWith(currentIndex: index));
  }

  void requestSubmission() {
    if (state.viewMode != ExamSolveViewMode.solving) return;
    _ticker?.cancel();
    emit(state.copyWith(viewMode: ExamSolveViewMode.confirming));
  }

  void cancelSubmission() {
    if (state.viewMode != ExamSolveViewMode.confirming) return;
    emit(state.copyWith(viewMode: ExamSolveViewMode.solving));
    _startTicker();
  }

  void confirmSubmission() {
    _ticker?.cancel();
    _transition?.cancel();

    if (!_isOnline) {
      emit(state.copyWith(viewMode: ExamSolveViewMode.pendingConnection));
      return;
    }

    emit(state.copyWith(viewMode: ExamSolveViewMode.grading));

    _transition = Timer(const Duration(milliseconds: 1200), () {
      if (isClosed) return;
      emit(
        state.copyWith(
          viewMode: ExamSolveViewMode.finished,
          result: _buildResult(),
        ),
      );
    });
  }

  void retryPendingSubmission() {
    if (!_isOnline) {
      emit(state.copyWith(viewMode: ExamSolveViewMode.pendingConnection));
      return;
    }
    confirmSubmission();
  }

  void refresh() {
    startAttempt();
  }

  int? _durationFromExam(ExamsModel? exam) {
    if (exam == null) return null;
    final minutes = int.tryParse(exam.time.split(':').first);
    if (minutes == null || minutes <= 0) return null;
    return minutes;
  }

  Duration _currentRemaining = Duration.zero;

  void _startTicker() {
    _ticker?.cancel();
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      if (isClosed || state.viewMode != ExamSolveViewMode.solving) return;

      final next = _currentRemaining - const Duration(seconds: 1);

      if (next <= Duration.zero) {
        _currentRemaining = Duration.zero;
        _remainingController.add(_currentRemaining);
        confirmSubmission();
        return;
      }

      _currentRemaining = next;
      _remainingController.add(_currentRemaining);
    });
  }

  ExamResultModel _buildResult() {
    return ExamResultModel(
      id: '${state.examTitle}-${DateTime.now().millisecondsSinceEpoch}',
      examTitle: state.examTitle,
      score: state.score,
      totalDegrees: state.totalDegrees,
      totalQuestions: state.totalQuestions,
      correctCount: state.correctCount,
      wrongCount: state.wrongCount,
      unansweredCount: state.unansweredCount,
      duration: 'الآن',
    );
  }

  @override
  Future<void> close() async {
    _ticker?.cancel();
    _transition?.cancel();
    await _remainingController.close();
    await super.close();
  }
}
