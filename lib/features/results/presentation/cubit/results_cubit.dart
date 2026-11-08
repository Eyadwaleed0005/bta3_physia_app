import 'package:bta3_physia/features/results/data/models/exam_result_model.dart';
import 'package:bta3_physia/features/results/presentation/cubit/results_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultsCubit extends Cubit<ResultsState> {
  ResultsCubit({
    ResultsViewMode viewMode = ResultsViewMode.available,
    List<ExamResultModel>? items,
  }) : super(
         ResultsState(
           viewMode: viewMode,
           items: items ?? ExamResultModel.defaultResults(),
         ),
       );

  void setViewMode(ResultsViewMode mode) {
    emit(state.copyWith(viewMode: mode));
  }

  void refresh() {
    emit(state.copyWith(viewMode: ResultsViewMode.loading));

    Future.delayed(const Duration(milliseconds: 600), () {
      if (isClosed) return;

      final items = ExamResultModel.defaultResults();

      emit(
        state.copyWith(
          viewMode: items.isEmpty
              ? ResultsViewMode.empty
              : ResultsViewMode.available,
          items: items,
        ),
      );
    });
  }

  void retry() {
    refresh();
  }

  void load(ExamResultModel result) {
    emit(state.copyWith(viewMode: ResultsViewMode.loading, result: result));

    Future.delayed(const Duration(milliseconds: 500), () {
      if (isClosed) return;
      emit(state.copyWith(viewMode: ResultsViewMode.available));
    });
  }

  void retryResult() {
    final result = state.result;
    if (result == null) {
      emit(state.copyWith(viewMode: ResultsViewMode.failure));
      return;
    }
    load(result);
  }

  void markFailure() {
    emit(state.copyWith(viewMode: ResultsViewMode.failure));
  }
}
