import 'package:bta3_physia/features/exams/data/models/exams_model.dart';
import 'package:equatable/equatable.dart';

enum ExamsViewMode {
  empty,
  failure,
  available,
  loading,
  starting,
  grading,
  closed,
  deleted,
  pendingConnection,
  confirm,
  resume,
  submission,
}

class ExamsState extends Equatable {
  const ExamsState({
    this.viewMode = ExamsViewMode.available,
    this.items = const [],
  });

  final ExamsViewMode viewMode;
  final List<ExamsModel> items;

  ExamsState copyWith({ExamsViewMode? viewMode, List<ExamsModel>? items}) {
    return ExamsState(
      viewMode: viewMode ?? this.viewMode,
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [viewMode, items];
}
