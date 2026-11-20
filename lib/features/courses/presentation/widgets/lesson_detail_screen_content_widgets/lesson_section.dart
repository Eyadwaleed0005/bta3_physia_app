import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LessonSection extends StatelessWidget {
  const LessonSection({
    super.key,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onPressed,
    this.isPrimary = false,
  });

  final String title;
  final String description;
  final String buttonText;
  final VoidCallback onPressed;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: isPrimary ? ColorPalette.panelGlass : ColorPalette.fieldFill,
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
                      title,
                      style: AppTextStyle.font16TextLightBoldTajawal(),
                    ),
                    Text(
                      description,
                      textAlign: TextAlign.right,
                      style: AppTextStyle.font12TextMutedRegularTajawal(),
                    ),
                  ],
                ),
              ),
              horizontalSpace(12),
              if (isPrimary)
                Container(
                  width: 44.w,
                  height: 44.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: ColorPalette.screenBackground,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Text(
                    'PDF',
                    style: AppTextStyle.font12TextSecondaryBoldTajawal(),
                  ),
                ),
            ],
          ),
          verticalSpace(12),

          CustomButton(
            onPressed: onPressed,
            height: 48.h,
            background: ColorPalette.accent,
            foreground: ColorPalette.textPrimary,
            borderRadius: 24.r,
            text: buttonText,
            textStyle: AppTextStyle.font16TextPrimaryBoldTajawal(),
          ),
        ],
      ),
    );
  }
}
