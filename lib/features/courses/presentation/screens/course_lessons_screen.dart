import 'package:bta3_physia/core/helper/app_system_ui.dart';
import 'package:bta3_physia/core/widgets/background/app_screen_backdrop.dart';
import 'package:bta3_physia/features/courses/data/models/course_model.dart';
import 'package:bta3_physia/features/courses/presentation/widgets/course_lessons_screen_content_widgets/course_lessons_screen_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CourseLessonsScreen extends StatelessWidget {
  final CourseModel course;
  const CourseLessonsScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppSystemUi.dark(),
      child: AppScreenBackdrop(
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: CourseLessonsScreenContent(course: course),
          ),
        ),
      ),
    );
  }
}
