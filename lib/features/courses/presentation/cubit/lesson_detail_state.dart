import 'package:bta3_physia/features/courses/data/models/course_lesson_model.dart';
import 'package:equatable/equatable.dart';

enum LessonDetailViewMode { loading, available, failure }

class LessonDetailState extends Equatable {
  const LessonDetailState({
    this.lessons = const [],
    this.lessonIndex = 0,
    this.courseTitle = '',
    this.viewMode = LessonDetailViewMode.failure,
  });

  final List<CourseLessonModel> lessons;
  final int lessonIndex;
  final String courseTitle;
  final LessonDetailViewMode viewMode;

  CourseLessonModel? get lesson =>
      lessonIndex >= 0 && lessonIndex < lessons.length
      ? lessons[lessonIndex]
      : null;

  int get lessonsCount => lessons.length;

  bool get hasPrevious => lessonIndex > 0;

  bool get hasNext => lessonIndex < lessons.length - 1;

  LessonDetailState copyWith({
    List<CourseLessonModel>? lessons,
    int? lessonIndex,
    String? courseTitle,
    LessonDetailViewMode? viewMode,
  }) {
    return LessonDetailState(
      lessons: lessons ?? this.lessons,
      lessonIndex: lessonIndex ?? this.lessonIndex,
      courseTitle: courseTitle ?? this.courseTitle,
      viewMode: viewMode ?? this.viewMode,
    );
  }

  @override
  List<Object?> get props => [lessons, lessonIndex, courseTitle, viewMode];
}