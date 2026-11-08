import 'package:bta3_physia/core/helper/arabic_numbers_helper.dart';
import 'package:bta3_physia/features/exams/data/models/exam_question_model.dart';
import 'package:bta3_physia/features/results/data/models/exam_result_model.dart';
import 'package:equatable/equatable.dart';

enum ExamSolveViewMode {
  starting,
  solving,
  confirming,
  grading,
  finished,
  failure,
  closed,
  deleted,
  pendingConnection,
  resume,
}

class ExamSolveState extends Equatable {
  const ExamSolveState({
    this.title = 'حل الامتحان',
    this.subTitle = 'الصف الثالث الثانوي',
    this.examTitle = 'مراجعة الحركة في خط مستقيم',
    this.viewMode = ExamSolveViewMode.starting,
    this.questions = const [],
    this.currentIndex = 0,
    this.result,
  });

  final String title;
  final String subTitle;
  final String examTitle;
  final ExamSolveViewMode viewMode;
  final List<ExamQuestionModel> questions;
  final int currentIndex;
  final ExamResultModel? result;

  int get totalQuestions => questions.length;

  ExamQuestionModel? get currentQuestion {
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

  String get answeredCounterLabel =>
      'تمت الإجابة عن ${toArabicNumbers(answeredCount)} من ${toArabicNumbers(totalQuestions)}';

  String get degreesLabel {
    final degrees = currentQuestion?.degrees ?? 0;
    if (degrees == 1) return 'درجة واحدة';
    if (degrees == 2) return 'درجتان';
    if (degrees <= 10) return '${toArabicNumbers(degrees)} درجات';
    return '${toArabicNumbers(degrees)} درجة';
  }

  ExamSolveState copyWith({
    String? title,
    String? subTitle,
    String? examTitle,
    ExamSolveViewMode? viewMode,
    List<ExamQuestionModel>? questions,
    int? currentIndex,
    ExamResultModel? result,
  }) {
    return ExamSolveState(
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
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
    subTitle,
    examTitle,
    viewMode,
    questions,
    currentIndex,
    result,
  ];
}
