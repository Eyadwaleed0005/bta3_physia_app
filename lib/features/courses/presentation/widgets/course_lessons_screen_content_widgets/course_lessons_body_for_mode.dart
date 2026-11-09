import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/core/helper/arabic_numbers_helper.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/features/courses/data/models/course_model.dart';
import 'package:bta3_physia/features/courses/data/models/lesson_detail_arguments.dart';
import 'package:bta3_physia/features/courses/presentation/widgets/course_lessons_screen_content_widgets/course_header.dart';
import 'package:bta3_physia/features/courses/presentation/widgets/course_lessons_screen_content_widgets/course_lesson_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseLessonsBodyForMode extends StatelessWidget {
  const CourseLessonsBodyForMode({super.key, required this.course});

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 12.h),
      child: Column(
        children: [
          CourseHeader(course: course),
          verticalSpace(26),
          Row(
            children: [
              Text(
                '${toArabicNumbers(course.lessonsCount)} دروس',
                style: AppTextStyle.font13TextSecondaryBoldTajawal(),
              ),
              const Spacer(),
              Text('الدروس', style: AppTextStyle.font18TextLightBoldTajawal()),
            ],
          ),
          verticalSpace(12),
          Expanded(
            child: ListView.separated(
              physics: AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) => CourseLessonTile(
                lesson: course.lessons[index],
                onTap: () => Navigator.of(context).pushNamed(
                  RouteNames.lessonDetailScreen,
                  arguments: LessonDetailArguments(
                    lessons: course.lessons,
                    lessonIndex: index,
                    courseTitle: course.title,
                  ),
                ),
              ),
              separatorBuilder: (context, index) => verticalSpace(10),
              itemCount: course.lessons.length,
            ),
          ),
        ],
      ),
    );
  }
}
