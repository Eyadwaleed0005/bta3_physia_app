import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/widgets/app_toast.dart';
import 'package:bta3_physia/features/courses/data/models/course_model.dart';
import 'package:bta3_physia/features/courses/presentation/widgets/courses_screen_content_widgets/course_card.dart';
import 'package:flutter/material.dart';

class CoursesAvailableState extends StatelessWidget {
  final List<CourseModel> courses;

  const CoursesAvailableState({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: courses.length,
      separatorBuilder: (_, _) => verticalSpace(14),
      itemBuilder: (context, i) => CourseCard(
        course: courses[i],
        onOpen: () {
          Navigator.of(context)
              .pushNamed(RouteNames.courseLessonsScreen, arguments: courses[i]);
        },
        onActivate: () {
          showAppToast(
            context,
            message: 'سيتم تفعيل الاشتراك قريباً',
            icon: Icons.lock_clock_rounded,
          );
        },
      ),
    );
  }
}
