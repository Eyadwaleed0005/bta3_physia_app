import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/core/widgets/custom_app_bar.dart';
import 'package:bta3_physia/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoutScreenContent extends StatelessWidget {
  const LogoutScreenContent({
    super.key,
    this.onLogoutPressed,
    this.onStayPressed,
  });

  final VoidCallback? onLogoutPressed;
  final VoidCallback? onStayPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const CustomAppBar(title: 'تسجيل الخروج', subTitle: 'تأكيد الإجراء'),
          verticalSpace(16),
          Expanded(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 28.h,
                    ),
                    decoration: BoxDecoration(
                      color: ColorPalette.panelGlass,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.logout_rounded,
                          size: 40.r,
                          color: ColorPalette.wine200,
                        ),
                        verticalSpace(14),
                        Text(
                          'هل تريد تسجيل الخروج؟',
                          style: AppTextStyle.font20TextLightBoldTajawal(),
                        ),
                        verticalSpace(8),
                        Text(
                          'تبقى بياناتك ونتائجك واشتراكاتك محفوظة. يمكنك العودة إلى الحساب بعد تسجيل الدخول.',
                          textAlign: TextAlign.right,
                          style: AppTextStyle.font14TextMutedRegularTajawal(),
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(24),
                  CustomButton(
                    onPressed: onLogoutPressed,
                    height: 48.h,
                    background: ColorPalette.accent,
                    foreground: ColorPalette.textPrimary,
                    borderRadius: 24.r,
                    text: 'تسجيل الخروج',
                    textStyle: AppTextStyle.font16TextPrimaryBoldTajawal(),
                  ),
                  verticalSpace(12),
                  Center(
                    child: TextButton(
                      onPressed: onStayPressed,
                      child: Text(
                        'البقاء في الحساب',
                        style: AppTextStyle.font14TextSecondaryBoldTajawal(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
