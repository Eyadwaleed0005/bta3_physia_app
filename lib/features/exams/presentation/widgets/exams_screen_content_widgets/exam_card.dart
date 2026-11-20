import 'package:bta3_physia/app/routes/app_images_routes.dart';
import 'package:bta3_physia/core/helper/arabic_numbers_helper.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/core/widgets/custom_button.dart';
import 'package:bta3_physia/features/exams/data/models/exams_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExamCard extends StatelessWidget {
  const ExamCard({super.key, required this.exam, this.onStart});

  final ExamsModel exam;
  final VoidCallback? onStart;

  @override
  Widget build(BuildContext context) {
    // Parse time from "60:00" format to minutes
    final minutes = int.tryParse(exam.time.split(':').first) ?? 0;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: ColorPalette.panelGlass,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'متاح لصفّك',
                      style: AppTextStyle.font12TextSecondaryBoldTajawal(),
                    ),
                    Text(
                      exam.title,
                      textAlign: TextAlign.right,
                      style: AppTextStyle.font18TextLightBoldTajawal(),
                    ),
                  ],
                ),
              ),
              horizontalSpace(12),
              Container(
                width: 44.w,
                height: 44.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ColorPalette.screenBackground,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: SvgPicture.asset(
                  AppImage().blueExam,
                  fit: BoxFit.contain,
                  width: 24.r,
                  height: 24.r,
                ),
              ),
            ],
          ),
          verticalSpace(6),
          Text(
            '${toArabicNumbers(exam.totlaQuestions)} أسئلة • ${toArabicNumbers(exam.totalDegrees)} درجات • ${toArabicNumbers(minutes)} دقيقة',
            style: AppTextStyle.font12TextMutedRegularTajawal(),
          ),
          verticalSpace(14),
          CustomButton(
            onPressed: onStart,
            height: 48.h,
            background: ColorPalette.accent,
            foreground: ColorPalette.textPrimary,
            borderRadius: 24.r,
            text: 'بدء الامتحان',
            textStyle: AppTextStyle.font16TextPrimaryBoldTajawal(),
          ),
        ],
      ),
    );
  }
}
