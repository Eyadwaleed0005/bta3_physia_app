import 'package:bta3_physia/features/courses/data/models/course_lesson_model.dart';

class LessonDetailArguments {
  const LessonDetailArguments({
    required this.lessons,
    required this.lessonIndex,
    required this.courseTitle,
  });

  final List<CourseLessonModel> lessons;
  final int lessonIndex;
  final String courseTitle;

  CourseLessonModel get lesson => lessons[lessonIndex];
}