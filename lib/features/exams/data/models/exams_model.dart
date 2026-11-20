import 'package:equatable/equatable.dart';

class ExamsModel extends Equatable {
  const ExamsModel({
    required this.id,
    required this.title,
    required this.totlaQuestions,
    required this.totalDegrees,
    required this.time,
    this.isCompleted = false,
  });

  final String id;
  final String title;
  final int totlaQuestions;
  final int totalDegrees;
  final String time;
  final bool isCompleted;

  ExamsModel copyWith({
    String? id,
    String? title,
    int? questions,
    String? time,
    int? totalDegrees,

    bool? isCompleted,
  }) {
    return ExamsModel(
      id: id ?? this.id,
      title: title ?? this.title,
      totlaQuestions: questions ?? this.totlaQuestions,
      time: time ?? this.time,
      isCompleted: isCompleted ?? this.isCompleted,
      totalDegrees: totalDegrees ?? this.totalDegrees,
    );
  }

  @override
  List<Object?> get props => [id, title, totlaQuestions, time, isCompleted];

  static List<ExamsModel> defaultItems() {
    return const [
      ExamsModel(
        id: "1",
        title: "امتحان 1",
        totlaQuestions: 20,
        totalDegrees: 60,
        time: "60",
        isCompleted: false,
      ),
      ExamsModel(
        id: "2",
        title: "امتحان 2",
        totlaQuestions: 20,
        totalDegrees: 60,

        time: "45",
        isCompleted: false,
      ),
      ExamsModel(
        id: "3",
        title: "امتحان 3",
        totlaQuestions: 20,
        totalDegrees: 60,

        time: "60",
        isCompleted: false,
      ),
      ExamsModel(
        id: "4",
        title: "امتحان 4",
        totlaQuestions: 20,
        totalDegrees: 60,

        time: "60",
        isCompleted: false,
      ),
      ExamsModel(
        id: "5",
        title: "امتحان 5",
        totlaQuestions: 20,
        totalDegrees: 60,

        time: "60",
        isCompleted: false,
      ),
    ];
  }
}
