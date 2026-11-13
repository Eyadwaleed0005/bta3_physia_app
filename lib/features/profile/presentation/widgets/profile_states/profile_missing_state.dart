import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileMissingState extends StatelessWidget {
  const ProfileMissingState({
    super.key,
    this.title = 'أضف بياناتك الشخصية',
    this.subtitle = 'أكمل الاسم والبريد الإلكتروني لتسهيل إدارة حسابك.',
    this.buttonText = 'إكمال البيانات',
    this.switchAccountsText = 'التبديل بين الحسابات',
    this.onCompleteDataPressed,
    this.onSwitchAccountsPressed,
  });

  final String title;
  final String subtitle;
  final String buttonText;
  final String switchAccountsText;
  final VoidCallback? onCompleteDataPressed;
  final VoidCallback? onSwitchAccountsPressed;

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
                Icons.person_outline_rounded,
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
          onPressed: onCompleteDataPressed,
          height: 48.h,
          background: ColorPalette.accent,
          foreground: ColorPalette.textPrimary,
          borderRadius: 24.r,
          text: buttonText,
          textStyle: AppTextStyle.font16TextPrimaryBoldTajawal(),
        ),
        verticalSpace(12),
        Center(
          child: TextButton(
            onPressed: onSwitchAccountsPressed,
            child: Text(
              switchAccountsText,
              style: AppTextStyle.font14TextSecondaryBoldTajawal(),
            ),
          ),
        ),
      ],
    );
  }
}
