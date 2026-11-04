import 'package:equatable/equatable.dart';

class ExamsModel extends Equatable {
  const ExamsModel({
    required this.id,
    required this.title,
    required this.totlaQuestions,
    required this.totalDegrees,
    required this.examInformation,

    required this.time,
    this.isCompleted = false,
  });

  final String id;
  final String title;
  final int totlaQuestions;
  final int totalDegrees;
  final String time;
  final bool isCompleted;
  final ExamInformationModel examInformation;

  ExamsModel copyWith({
    String? id,
    String? title,
    int? questions,
    String? time,
    int? totalDegrees,

    bool? isCompleted,
    ExamInformationModel? examInformation,
  }) {
    return ExamsModel(
      id: id ?? this.id,
      title: title ?? this.title,
      totlaQuestions: questions ?? this.totlaQuestions,
      time: time ?? this.time,
      isCompleted: isCompleted ?? this.isCompleted,
      totalDegrees: totalDegrees ?? this.totalDegrees,
      examInformation: examInformation ?? this.examInformation,
    );
  }

  @override
  List<Object?> get props => [id, title, totlaQuestions, time, isCompleted];

  static List<ExamsModel> defaultItems() {
    return const [];
  }
}

class ExamInformationModel extends Equatable {
  final int numOfDegreesPerQuestion;
  final String questionText;
  final List<String> answersText;
  final List<int> correctAnswersIndex;

  const ExamInformationModel({
    required this.numOfDegreesPerQuestion,
    required this.questionText,
    required this.answersText,
    required this.correctAnswersIndex,
  });

  ExamInformationModel copyWith({
    int? numOfDegreesPerQuestion,
    String? questionText,
    List<String>? answersText,
    List<int>? correctAnswersIndex,
  }) {
    return ExamInformationModel(
      numOfDegreesPerQuestion:
          numOfDegreesPerQuestion ?? this.numOfDegreesPerQuestion,
      questionText: questionText ?? this.questionText,
      answersText: answersText ?? this.answersText,
      correctAnswersIndex: correctAnswersIndex ?? this.correctAnswersIndex,
    );
  }

  @override
  List<Object?> get props => [
    numOfDegreesPerQuestion,
    questionText,
    answersText,
    correctAnswersIndex,
  ];
}
