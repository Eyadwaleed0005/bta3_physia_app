import 'package:bta3_physia/app/routes/app_images_routes.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/features/courses/data/models/course_model.dart';
import 'package:bta3_physia/features/courses/presentation/widgets/course_free_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseHeader extends StatelessWidget {
  const CourseHeader({super.key, required this.course});

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: ColorPalette.panelGlass,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  course.title,
                  textAlign: TextAlign.end,
                  style: AppTextStyle.font18TextLightBoldTajawal(),
                ),
                if (course.isFree) ...[const CourseFreeBadge()],
              ],
            ),
          ),
          horizontalSpace(8),
          Expanded(
            child: Container(
              width: 120.w,
              height: 70.w,
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
    );
  }
}
