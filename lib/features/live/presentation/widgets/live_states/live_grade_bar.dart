import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LiveGradeBar extends StatelessWidget {
  const LiveGradeBar({
    super.key,
    this.subject = 'الفيزياء',
    this.grade = 'الصف الثالث الثانوي',
  });

  final String subject;
  final String grade;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 42.h,
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      decoration: BoxDecoration(
        color: ColorPalette.fieldFill,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Text(subject, style: AppTextStyle.font13TextSecondaryBoldTajawal()),
          const Spacer(),
          Text(grade, style: AppTextStyle.font14TextLightBoldTajawal()),
        ],
      ),
    );
  }
}
