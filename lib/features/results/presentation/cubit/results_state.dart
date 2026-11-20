import 'package:bta3_physia/core/helper/arabic_numbers_helper.dart';
import 'package:bta3_physia/features/results/data/models/exam_result_model.dart';
import 'package:equatable/equatable.dart';

enum ResultsViewMode { loading, empty, available, failure }

class ResultsState extends Equatable {
  const ResultsState({
    this.title = 'نتائجي',
    this.subTitle = 'الصف الثالث الثانوي',
    this.viewMode = ResultsViewMode.available,
    this.items = const [],
    this.resultTitle = 'نتيجة الامتحان',
    this.resultSubTitle = 'الصف الثالث الثانوي',
    this.result,
  });

  final String title;
  final String subTitle;
  final ResultsViewMode viewMode;
  final List<ExamResultModel> items;
  final String resultTitle;
  final String resultSubTitle;
  final ExamResultModel? result;

  int get resultsCount => items.length;
  bool get hasResults => items.isNotEmpty;
  String get examTitle => result?.examTitle ?? '';

  String get scoreLabel {
    final value = result;
    if (value == null) return '';
    return '${toArabicNumbers(value.score)} من ${toArabicNumbers(value.totalDegrees)}';
  }

  ResultsState copyWith({
    String? title,
    String? subTitle,
    ResultsViewMode? viewMode,
    List<ExamResultModel>? items,
    String? resultTitle,
    String? resultSubTitle,
    ExamResultModel? result,
  }) {
    return ResultsState(
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      viewMode: viewMode ?? this.viewMode,
      items: items ?? this.items,
      resultTitle: resultTitle ?? this.resultTitle,
      resultSubTitle: resultSubTitle ?? this.resultSubTitle,
      result: result ?? this.result,
    );
  }

  @override
  List<Object?> get props => [
    title,
    subTitle,
    viewMode,
    items,
    resultTitle,
    resultSubTitle,
    result,
  ];
}
