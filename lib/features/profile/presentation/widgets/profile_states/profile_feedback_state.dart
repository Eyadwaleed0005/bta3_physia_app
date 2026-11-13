import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileFeedbackState extends StatelessWidget {
  const ProfileFeedbackState({
    super.key,
    this.title = 'تعذر الاتصال',
    this.subtitle = 'تحقق من اتصالك بالإنترنت. حاول مرة أخرى.',
    this.retryButtonText = 'إعادة المحاولة',
    this.chooseAccountText = 'اختيار حساب آخر',
    this.onRetryPressed,
    this.onChooseAccountPressed,
  });

  final String title;
  final String subtitle;
  final String retryButtonText;
  final String chooseAccountText;
  final VoidCallback? onRetryPressed;
  final VoidCallback? onChooseAccountPressed;

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
                Icons.warning_amber,
                size: 38.r,
                color: ColorPalette.wine200,
              ),
              verticalSpace(14),
              Text(title, style: AppTextStyle.font20TextLightBoldTajawal()),
              verticalSpace(8),
              Text(
                subtitle,
                textAlign: TextAlign.right,
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
            onPressed: onChooseAccountPressed,
            child: Text(
              chooseAccountText,
              style: AppTextStyle.font14TextSecondaryBoldTajawal(),
            ),
          ),
        ),
      ],
    );
  }
}
