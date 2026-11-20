import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsUnavailableState extends StatelessWidget {
  const NotificationsUnavailableState({
    super.key,
    this.title = 'المحتوى غير متاح',
    this.subtitle =
        'لم يعد هذا المحتوى متاحًا. عُد إلى قائمة الإشعارات لمتابعة الجديد.',
    this.returnButtonText = 'العودة إلى الإشعارات',
    this.onReturnPressed,
  });

  final String title;
  final String subtitle;
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
            crossAxisAlignment: CrossAxisAlignment.end,

            children: [
              Icon(
                Icons.notifications_none,
                size: 36.r,
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
          onPressed: onReturnPressed,
          height: 48.h,
          background: ColorPalette.accent,
          foreground: ColorPalette.textPrimary,
          borderRadius: 24.r,
          text: returnButtonText,
          textStyle: AppTextStyle.font16TextPrimaryBoldTajawal(),
        ),
      ],
    );
  }
}
