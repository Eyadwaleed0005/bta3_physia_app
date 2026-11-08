import 'package:bta3_physia/app/routes/app_images_routes.dart';
import 'package:bta3_physia/core/helper/arabic_numbers_helper.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/core/widgets/custom_button.dart';
import 'package:bta3_physia/features/results/data/models/exam_result_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ResultCard extends StatelessWidget {
  final ExamResultModel result;
  final VoidCallback onTap;

  const ResultCard({super.key, required this.result, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final minutes = int.tryParse(result.duration.split(':').first) ?? 0;

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
                      'اكتملت المحاولة',
                      style: AppTextStyle.font12TextSecondaryBoldTajawal(),
                    ),
                    Text(
                      result.examTitle,
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
            '${toArabicNumbers(result.totalQuestions)} أسئلة • ${toArabicNumbers(result.totalDegrees)} درجات • ${toArabicNumbers(minutes)} دقيقة',
            style: AppTextStyle.font12TextMutedRegularTajawal(),
          ),
          verticalSpace(14),
          CustomButton(
            onPressed: onTap,
            height: 48.h,
            background: ColorPalette.accent,
            foreground: ColorPalette.textPrimary,
            borderRadius: 24.r,
            text: 'عرض النتيجة',
            textStyle: AppTextStyle.font16TextPrimaryBoldTajawal(),
          ),
        ],
      ),
    );
  }
}
