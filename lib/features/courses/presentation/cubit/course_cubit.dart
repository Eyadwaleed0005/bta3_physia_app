import 'package:bta3_physia/features/courses/data/models/course_model.dart';
import 'package:bta3_physia/features/courses/presentation/cubit/course_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseCubit extends Cubit<CourseState> {
  CourseCubit() : super(CourseState(courses: CourseModel.defaultItems()));

  void setViewMode(CourseViewMode mode) {
    emit(state.copyWith(viewMode: mode));
  }

  void setFilter(CourseFilter filter) {
    if (state.filter == filter) return;
    emit(state.copyWith(filter: filter));
  }

  void updateQuery(String query) {
    emit(state.copyWith(query: query));
  }

  void refresh() {
    emit(state.copyWith(viewMode: CourseViewMode.loading));

    Future.delayed(const Duration(milliseconds: 600), () {
      if (isClosed) return;

      final items = CourseModel.defaultItems();
      emit(
        state.copyWith(
          viewMode: items.isEmpty
              ? CourseViewMode.empty
              : CourseViewMode.available,
          courses: items,
        ),
      );
    });
  }
}
