import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsFailureState extends StatelessWidget {
  const NotificationsFailureState({
    super.key,
    this.title = 'تعذّر تحميل الإشعارات',
    this.subtitle = 'حدث خطأ أثناء تحميل القائمة. حاول مرة أخرى.',
    this.retryButtonText = 'إعادة المحاولة',
    this.returnHomeText = 'العودة إلى الرئيسية',
    this.onRetryPressed,
    this.onReturnHomePressed,
  });

  final String title;
  final String subtitle;
  final String retryButtonText;
  final String returnHomeText;
  final VoidCallback? onRetryPressed;
  final VoidCallback? onReturnHomePressed;

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
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(
                Icons.warning_amber_sharp,
                size: 38.r,
                color: ColorPalette.wine200,
              ),
              verticalSpace(14),
              Text(
                title,
                textAlign: TextAlign.end,
                style: AppTextStyle.font20TextLightBoldTajawal(),
              ),
              verticalSpace(8),
              Text(
                subtitle,
                textAlign: TextAlign.end,

                style: AppTextStyle.font14TextMutedRegularTajawal(),
              ),
            ],
          ),
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
        verticalSpace(12),
        Center(
          child: TextButton(
            onPressed: onReturnHomePressed,
            child: Text(
              returnHomeText,
              style: AppTextStyle.font14TextSecondaryBoldTajawal(),
            ),
          ),
        ),
      ],
    );
  }
}
