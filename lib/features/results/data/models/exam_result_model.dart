import 'package:equatable/equatable.dart';

class ExamResultModel extends Equatable {
  const ExamResultModel({
    required this.id,
    required this.examTitle,
    required this.score,
    required this.totalDegrees,
    required this.totalQuestions,
    required this.correctCount,
    required this.wrongCount,
    required this.unansweredCount,
    required this.submittedAt,
    this.canRetry = false,
  });

  final String id;
  final String examTitle;
  final int score;
  final int totalDegrees;
  final int totalQuestions;
  final int correctCount;
  final int wrongCount;
  final int unansweredCount;
  final String submittedAt;
  final bool canRetry;

  double get percentage {
    if (totalDegrees == 0) return 0;
    return score / totalDegrees;
  }

  ExamResultModel copyWith({
    String? id,
    String? examTitle,
    int? score,
    int? totalDegrees,
    int? totalQuestions,
    int? correctCount,
    int? wrongCount,
    int? unansweredCount,
    String? submittedAt,
    bool? canRetry,
  }) {
    return ExamResultModel(
      id: id ?? this.id,
      examTitle: examTitle ?? this.examTitle,
      score: score ?? this.score,
      totalDegrees: totalDegrees ?? this.totalDegrees,
      totalQuestions: totalQuestions ?? this.totalQuestions,
      correctCount: correctCount ?? this.correctCount,
      wrongCount: wrongCount ?? this.wrongCount,
      unansweredCount: unansweredCount ?? this.unansweredCount,
      submittedAt: submittedAt ?? this.submittedAt,
      canRetry: canRetry ?? this.canRetry,
    );
  }

  @override
  List<Object?> get props => [
    id,
    examTitle,
    score,
    totalDegrees,
    totalQuestions,
    correctCount,
    wrongCount,
    unansweredCount,
    submittedAt,
    canRetry,
  ];

  static List<ExamResultModel> defaultResults() {
    return const [
      ExamResultModel(
        id: '1',
        examTitle: 'مراجعة الحركة في خط مستقيم',
        score: 10,
        totalDegrees: 20,
        totalQuestions: 10,
        correctCount: 5,
        wrongCount: 3,
        unansweredCount: 2,
        submittedAt: 'اليوم، ٨:٠٠ م',
      ),
      ExamResultModel(
        id: '2',
        examTitle: 'امتحان الحركة بعجلة ثابتة',
        score: 14,
        totalDegrees: 20,
        totalQuestions: 10,
        correctCount: 7,
        wrongCount: 2,
        unansweredCount: 1,
        submittedAt: 'أمس، ٥:٣٠ م',
      ),
      ExamResultModel(
        id: '3',
        examTitle: 'مراجعة قوانين نيوتن',
        score: 6,
        totalDegrees: 20,
        totalQuestions: 10,
        correctCount: 3,
        wrongCount: 4,
        unansweredCount: 3,
        submittedAt: 'منذ ٣ أيام',
      ),
    ];
  }
}
