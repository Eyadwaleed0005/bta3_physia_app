import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LiveOfflineState extends StatelessWidget {
  const LiveOfflineState({
    super.key,
    this.title = 'لا يوجد اتصال بالإنترنت',
    this.subtitle = 'تحقق من اتصالك ثم أعد تحميل البث.',
    this.retryButtonText = 'إعادة المحاولة',
    this.onRetryPressed,
  });

  final String title;
  final String subtitle;
  final String retryButtonText;
  final VoidCallback? onRetryPressed;

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
                Icons.wifi_off_rounded,
                size: 68.r,
                color: ColorPalette.wine200,
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
              verticalSpace(24),
              CustomButton(
                onPressed: onRetryPressed,
                height: 48.h,
                background: ColorPalette.accent,
                foreground: ColorPalette.textPrimary,
                borderRadius: 24.r,
                text: retryButtonText,
                textStyle: AppTextStyle.font16TextPrimaryBoldTajawal(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
