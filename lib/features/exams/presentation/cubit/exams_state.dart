import 'package:bta3_physia/features/exams/data/models/exams_model.dart';
import 'package:equatable/equatable.dart';

enum ExamsViewMode { empty, failure, available, loading, pendingConnection }

class ExamsState extends Equatable {
  const ExamsState({
    this.title = 'الامتحانات',
    this.subTitle = 'الصف الثالث الثانوي',
    this.viewMode = ExamsViewMode.available,
    this.items = const [],
  });

  final String title;
  final String subTitle;
  final ExamsViewMode viewMode;
  final List<ExamsModel> items;

  ExamsState copyWith({
    String? title,
    String? subTitle,
    ExamsViewMode? viewMode,
    List<ExamsModel>? items,
  }) {
    return ExamsState(
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      viewMode: viewMode ?? this.viewMode,
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [title, subTitle, viewMode, items];
}
