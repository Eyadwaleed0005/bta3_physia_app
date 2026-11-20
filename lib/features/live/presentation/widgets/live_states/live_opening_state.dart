import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LiveOpeningState extends StatelessWidget {
  const LiveOpeningState({
    super.key,
    this.title = 'جارٍ فتح البث في Zoom',
    this.subtitle = 'سننتقل إلى تطبيق Zoom لفتح البث.',
    this.buttonText = 'جارٍ فتح Zoom',
    this.returnButtonText = 'العودة إلى البث',
    this.onReturnPressed,
  });

  final String title;
  final String subtitle;
  final String buttonText;
  final String returnButtonText;
  final VoidCallback? onReturnPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 28.h),
          decoration: BoxDecoration(
            color: ColorPalette.panelGlass,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.open_in_new_rounded,
                color: ColorPalette.cream50,
                size: 68.r,
              ),
              verticalSpace(14),
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyle.font20TextLightBoldTajawal(),
              ),
              verticalSpace(8),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: AppTextStyle.font14TextMutedRegularTajawal(),
              ),
              verticalSpace(16),
              CustomButton(
                titleForRefreash: buttonText,
                isLoading: true,
                height: 48.h,
                background: ColorPalette.accent,
                foreground: ColorPalette.textPrimary,
                borderRadius: 24.r,
                text: buttonText,
                textStyle: AppTextStyle.font16TextPrimaryBoldTajawal(),
              ),
              verticalSpace(8),
              TextButton(
                onPressed: onReturnPressed,
                child: Text(
                  returnButtonText,
                  style: AppTextStyle.font14TextSecondaryBoldTajawal(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
