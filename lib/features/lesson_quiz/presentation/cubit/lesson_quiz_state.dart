import 'package:bta3_physia/core/helper/arabic_numbers_helper.dart';
import 'package:bta3_physia/features/lesson_quiz/data/models/lesson_quiz_model.dart';
import 'package:bta3_physia/features/lesson_quiz/data/models/lesson_quiz_result_model.dart';
import 'package:equatable/equatable.dart';

enum LessonQuizViewMode {
  starting,
  solving,
  grading,
  submitted,
  pendingConnection,
}

class LessonQuizState extends Equatable {
  const LessonQuizState({
    this.title = 'تدريب الدرس',
    this.examTitle = 'المسافة والإزاحة',
    this.viewMode = LessonQuizViewMode.starting,
    this.questions = const [],
    this.currentIndex = 0,
    this.result,
  });

  final String title;
  final String examTitle;
  final LessonQuizViewMode viewMode;
  final List<LessonQuizModel> questions;
  final int currentIndex;
  final LessonQuizResultModel? result;

  int get totalQuestions => questions.length;

  LessonQuizModel? get currentQuestion {
    if (currentIndex < 0 || currentIndex >= questions.length) return null;
    return questions[currentIndex];
  }

  int get answeredCount =>
      questions.where((question) => question.isAnswered).length;

  int get unansweredCount => totalQuestions - answeredCount;

  int get correctCount => questions
      .where((question) => question.isAnswered && question.isCorrect)
      .length;

  int get wrongCount => answeredCount - correctCount;

  int get totalDegrees =>
      questions.fold(0, (total, question) => total + question.degrees);

  int get score => questions
      .where((question) => question.isAnswered && question.isCorrect)
      .fold(0, (total, question) => total + question.degrees);

  bool get isFirstQuestion => currentIndex <= 0;

  bool get isLastQuestion => currentIndex >= totalQuestions - 1;

  String get questionCounterLabel =>
      'السؤال ${toArabicNumbers(currentIndex + 1)} من ${toArabicNumbers(totalQuestions)}';

  bool get isCurrentQuestionAnswered => currentQuestion?.isAnswered ?? false;

  LessonQuizState copyWith({
    String? title,
    String? subTitle,
    String? examTitle,
    LessonQuizViewMode? viewMode,
    List<LessonQuizModel>? questions,
    int? currentIndex,
    LessonQuizResultModel? result,
  }) {
    return LessonQuizState(
      title: title ?? this.title,
      examTitle: examTitle ?? this.examTitle,
      viewMode: viewMode ?? this.viewMode,
      questions: questions ?? this.questions,
      currentIndex: currentIndex ?? this.currentIndex,
      result: result ?? this.result,
    );
  }

  @override
  List<Object?> get props => [
    title,
    examTitle,
    viewMode,
    questions,
    currentIndex,
    result,
  ];
}
