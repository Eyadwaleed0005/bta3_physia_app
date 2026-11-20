import 'package:bta3_physia/features/courses/data/models/course_lesson_model.dart';
import 'package:bta3_physia/features/courses/presentation/cubit/lesson_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonDetailCubit extends Cubit<LessonDetailState> {
  LessonDetailCubit() : super(const LessonDetailState());

  void loadLesson({
    required List<CourseLessonModel> lessons,
    required int lessonIndex,
    required String courseTitle,
  }) {
    if (lessons.isEmpty) {
      emit(const LessonDetailState(viewMode: LessonDetailViewMode.failure));
      return;
    }

    emit(
      LessonDetailState(
        lessons: lessons,
        lessonIndex: lessonIndex.clamp(0, lessons.length - 1),
        courseTitle: courseTitle,
        viewMode: LessonDetailViewMode.available,
      ),
    );
  }

  void setViewMode(LessonDetailViewMode mode) {
    emit(state.copyWith(viewMode: mode));
  }
}