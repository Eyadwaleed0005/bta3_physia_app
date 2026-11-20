import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LessonQuizResultScoreSummary extends StatelessWidget {
  final String scoreLabel;

  const LessonQuizResultScoreSummary({super.key, required this.scoreLabel});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 161.w,
        height: 161.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorPalette.panelGlass,
          border: Border.all(color: ColorPalette.wine200, width: 6.w),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              scoreLabel,
              style: AppTextStyle.font22TextLightBoldTajawal().copyWith(
                color: ColorPalette.textSecondary,
              ),
            ),
            verticalSpace(2),
            Text('الدرجة', style: AppTextStyle.font13TextMutedRegularTajawal()),
          ],
        ),
      ),
    );
  }
}
