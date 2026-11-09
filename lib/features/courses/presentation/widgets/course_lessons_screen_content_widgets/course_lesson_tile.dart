import 'package:bta3_physia/app/routes/app_images_routes.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/features/courses/data/models/course_lesson_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseLessonTile extends StatelessWidget {
  const CourseLessonTile({super.key, required this.lesson, this.onTap});

  final CourseLessonModel lesson;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final List<LessonContentType> types = lesson.contentTypes;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: ColorPalette.fieldFill,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: ColorPalette.fieldBorder),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    lesson.title,
                    textAlign: TextAlign.end,
                    style: AppTextStyle.font15TextLightBoldTajawal(),
                  ),
                  verticalSpace(4),
                  Text(
                    lesson.description,
                    textAlign: TextAlign.end,
                    style: AppTextStyle.font12TextMutedRegularTajawal(),
                  ),
                  verticalSpace(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      for (int i = types.length - 1; i >= 0; i--) ...[
                        Text(
                          "${types[i].label} ${(i != 0) ? '·' : ''}",
                          style:
                              AppTextStyle.font11TextSecondaryRegularTajawal(),
                        ),
                        if (i != 0) horizontalSpace(6),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            horizontalSpace(12),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  gradient: ColorPalette.primaryGradient,
                  borderRadius: BorderRadius.circular(18.r),
                  border: Border.all(color: ColorPalette.fieldBorder),
                ),
                clipBehavior: Clip.antiAlias,
                child: FadeInImage(
                  placeholder: AssetImage(AppImage().courseBanner),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                  image: AssetImage(AppImage().courseBanner),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
