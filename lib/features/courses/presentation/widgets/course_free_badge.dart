import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseFreeBadge extends StatelessWidget {
  const CourseFreeBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: ColorPalette.panelGlass,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        'مجاني',
        style: AppTextStyle.font13TextHighLightBoldTajawal(),
      ),
    );
  }
}
