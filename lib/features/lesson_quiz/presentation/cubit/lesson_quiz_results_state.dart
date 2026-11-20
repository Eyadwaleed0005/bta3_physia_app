import 'package:bta3_physia/core/helper/arabic_numbers_helper.dart';
import 'package:bta3_physia/features/lesson_quiz/data/models/lesson_quiz_result_model.dart';
import 'package:equatable/equatable.dart';

class LessonQuizResultsState extends Equatable {
  const LessonQuizResultsState({
    this.title = 'نتائجي',
    this.subTitle = 'الصف الثالث الثانوي',
    this.resultTitle = 'نتيجة الامتحان',
    this.resultSubTitle = 'الصف الثالث الثانوي',
    this.result,
  });

  final String title;
  final String subTitle;
  final String resultTitle;
  final String resultSubTitle;
  final LessonQuizResultModel? result;

  String get examTitle => result?.examTitle ?? '';

  String get scoreLabel {
    final value = result;
    if (value == null) return '';
    return '${toArabicNumbers(value.score)} من ${toArabicNumbers(value.totalDegrees)}';
  }

  LessonQuizResultsState copyWith({
    String? title,
    String? subTitle,
    String? resultTitle,
    String? resultSubTitle,
    LessonQuizResultModel? result,
  }) {
    return LessonQuizResultsState(
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      resultTitle: resultTitle ?? this.resultTitle,
      resultSubTitle: resultSubTitle ?? this.resultSubTitle,
      result: result ?? this.result,
    );
  }

  @override
  List<Object?> get props => [
    title,
    subTitle,
    resultTitle,
    resultSubTitle,
    result,
  ];
}
