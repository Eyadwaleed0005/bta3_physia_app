import 'package:bta3_physia/core/helper/arabic_numbers_helper.dart';
import 'package:bta3_physia/core/widgets/custom_secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:bta3_physia/app/routes/app_images_routes.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/core/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ExamsConfirmSubmissionState extends StatelessWidget {
  final String countQuestions;
  final String remainingTime;
  final VoidCallback? onConfirmPressed;
  final VoidCallback? onReturnPressed;

  const ExamsConfirmSubmissionState({
    super.key,
    this.countQuestions = '3',
    this.remainingTime = '٣٠ : ٠١',
    this.onConfirmPressed,
    this.onReturnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          decoration: BoxDecoration(
            color: ColorPalette.panelGlass,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: ColorPalette.fieldFill,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Text(
                  remainingTime,
                  style: AppTextStyle.font20TextHighlightBoldTajawal(),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'الوقت المتبقي',
                      textAlign: TextAlign.end,
                      style: AppTextStyle.font13TextLightBoldTajawal(),
                    ),
                    Text(
                      'تُحفظ إجاباتك على هذا الجهاز',
                      textAlign: TextAlign.end,
                      style: AppTextStyle.font11TextMutedRegularTajawal(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        verticalSpace(16),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: ColorPalette.panelGlass,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SvgPicture.asset(AppImage().blueExam, width: 36.r, height: 36.r),
              verticalSpace(14),
              Text(
                'تسليم الامتحان؟',
                textAlign: TextAlign.end,
                style: AppTextStyle.font20TextLightBoldTajawal(),
              ),
              verticalSpace(8),
              Text(
                'ستُحسب الأسئلة غير المجاب عنها خطأ، ودرجتها صفر. لا يمكنك تعديل الإجابات بعد التسليم.',
                textAlign: TextAlign.end,
                style: AppTextStyle.font14TextMutedRegularTajawal(),
              ),
            ],
          ),
        ),
        verticalSpace(16),

        Text(
          'لم تُجب عن ${toArabicNumbers(int.parse(countQuestions))} أسئلة',
          textAlign: TextAlign.end,
          style: AppTextStyle.font16TextSecondaryBoldTajawal(),
        ),
        verticalSpace(16),
        CustomButton(
          onPressed: onConfirmPressed,
          height: 48.h,
          background: ColorPalette.accent,
          foreground: ColorPalette.textPrimary,
          borderRadius: 24.r,
          textStyle: AppTextStyle.font16TextPrimaryBoldTajawal(),
          text: 'تأكيد التسليم',
        ),
        verticalSpace(16),

        CustomSecondaryButton(
          onPressed: onReturnPressed,
          height: 48.h,
          backgroundColor: ColorPalette.fieldFill,
          foregroundColor: ColorPalette.textLight,
          text: 'العودة إلى الحل',
          borderRadius: 24.r,
          borderColor: ColorPalette.border,
          textStyle: AppTextStyle.font16TextPrimaryBoldTajawal(),
        ),
      ],
    );
  }
}
