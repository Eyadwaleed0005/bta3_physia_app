import 'dart:async';

import 'package:bta3_physia/features/lesson_quiz/data/models/lesson_quiz_model.dart';
import 'package:bta3_physia/features/lesson_quiz/data/models/lesson_quiz_result_model.dart';
import 'package:bta3_physia/features/lesson_quiz/presentation/cubit/lesson_quiz_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonQuizCubit extends Cubit<LessonQuizState> {
  LessonQuizCubit()
    : super(LessonQuizState());

  Timer? _transition;

  void startAttempt({LessonQuizModel? quiz}) {
    _transition?.cancel();

    emit(
      LessonQuizState(
        examTitle: quiz?.title ?? state.examTitle,
        viewMode: LessonQuizViewMode.starting,
        questions: LessonQuizModel.defaultQuestions(),
      ),
    );

    _transition = Timer(const Duration(milliseconds: 800), () {
      if (isClosed) return;
      emit(state.copyWith(viewMode: LessonQuizViewMode.solving));
    });
  }

  void confirmSubmission() {
    _transition?.cancel();

    emit(state.copyWith(viewMode: LessonQuizViewMode.grading));

    _transition = Timer(const Duration(milliseconds: 1200), () {
      if (isClosed) return;
      emit(
        state.copyWith(
          viewMode: LessonQuizViewMode.submitted,
          result: _buildResult(),
        ),
      );
    });
  }

  void setViewMode(LessonQuizViewMode mode) {
    _transition?.cancel();

    emit(state.copyWith(viewMode: mode));
  }

  void selectAnswer(int answerIndex) {
    if (state.viewMode != LessonQuizViewMode.solving) return;

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
    if (!state.isCurrentQuestionAnswered) return;

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

  void retryPendingSubmission() {
    confirmSubmission();
  }

  void refresh() {
    startAttempt();
  }

  LessonQuizResultModel _buildResult() {
    return LessonQuizResultModel(
      id: '${state.examTitle}-${DateTime.now().millisecondsSinceEpoch}',
      examTitle: state.examTitle,
      score: state.score,
      totalDegrees: state.totalDegrees,
      correctCount: state.correctCount,
      wrongCount: state.wrongCount,
      unansweredCount: state.unansweredCount,
      answers: state.questions,
    );
  }

  @override
  Future<void> close() async {
    _transition?.cancel();
    await super.close();
  }
}
