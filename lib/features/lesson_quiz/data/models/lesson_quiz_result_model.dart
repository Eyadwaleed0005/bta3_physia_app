import 'package:bta3_physia/features/lesson_quiz/data/models/lesson_quiz_model.dart';
import 'package:equatable/equatable.dart';

class LessonQuizResultModel extends Equatable {
  const LessonQuizResultModel({
    required this.id,
    required this.examTitle,
    required this.score,
    required this.totalDegrees,
    required this.correctCount,
    required this.wrongCount,
    required this.unansweredCount,
    required this.answers,
  });

  final String id;
  final String examTitle;
  final int score;
  final int totalDegrees;
  final int correctCount;
  final int wrongCount;
  final int unansweredCount;
  final List<LessonQuizModel> answers;

  double get percentage {
    if (totalDegrees == 0) return 0;
    return score / totalDegrees;
  }

  LessonQuizResultModel copyWith({
    String? id,
    String? examTitle,
    int? score,
    int? totalDegrees,
    int? correctCount,
    int? wrongCount,
    int? unansweredCount,
    List<LessonQuizModel>? answers,
  }) {
    return LessonQuizResultModel(
      id: id ?? this.id,
      examTitle: examTitle ?? this.examTitle,
      score: score ?? this.score,
      totalDegrees: totalDegrees ?? this.totalDegrees,
      correctCount: correctCount ?? this.correctCount,
      wrongCount: wrongCount ?? this.wrongCount,
      unansweredCount: unansweredCount ?? this.unansweredCount,
      answers: answers ?? this.answers,
    );
  }

  @override
  List<Object?> get props => [
    id,
    examTitle,
    score,
    totalDegrees,
    correctCount,
    wrongCount,
    unansweredCount,
    answers,
  ];

  static LessonQuizResultModel defaultResults = LessonQuizResultModel(
    id: '1',
    examTitle: 'مراجعة الحركة في خط مستقيم',
    score: 10,
    totalDegrees: 20,
    correctCount: 5,
    wrongCount: 3,
    unansweredCount: 2,
    answers: LessonQuizModel.defaultQuestions(),
  );
}
