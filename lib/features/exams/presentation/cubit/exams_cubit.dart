import 'package:bta3_physia/features/exams/data/models/exams_model.dart';
import 'package:bta3_physia/features/exams/presentation/cubit/exams_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamsCubit extends Cubit<ExamsState> {
  ExamsCubit({
    ExamsViewMode viewMode = ExamsViewMode.available,
    List<ExamsModel> items = const [],
  }) : super(ExamsState(viewMode: viewMode, items: items));

  void setViewMode(ExamsViewMode mode) {
    emit(state.copyWith(viewMode: mode));
  }

  void refresh() {
    emit(state.copyWith(viewMode: ExamsViewMode.loading));
    Future.delayed(const Duration(milliseconds: 600), () {
      if (!isClosed) {
        emit(
          state.copyWith(
            viewMode: ExamsViewMode.available,
            items: ExamsModel.defaultItems(),
          ),
        );
      }
    });
  }
}
