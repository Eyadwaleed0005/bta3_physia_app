import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LiveLoadingState extends StatelessWidget {
  const LiveLoadingState({
    super.key,
    this.title = 'جارٍ تحميل البث',
    this.subtitle = 'يرجى الانتظار قليلًا',
    this.buttonText = 'جارٍ التحميل',
    this.onRefreshPressed,
  });

  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback? onRefreshPressed;

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
              Icon(Icons.refresh, size: 68.r, color: ColorPalette.cream50),
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
            ],
          ),
        ),
      ],
    );
  }
}
