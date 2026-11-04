import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsPermissionState extends StatelessWidget {
  const NotificationsPermissionState({
    super.key,
    this.title = 'تابع كل جديد فور نشره',
    this.subtitle = 'اسمح بإشعارات الجهاز لتصلك تنبيهات الكورسات والدروس والامتحانات والبث المباشر.',
    this.note = 'يمكنك استخدام قائمة الإشعارات داخل التطبيق حتى إذا لم تسمح بتنبيهات الجهاز.',
    this.allowButtonText = 'السماح بالإشعارات',
    this.notNowButtonText = 'ليس الآن',
    this.onAllowPressed,
    this.onNotNowPressed,
  });

  final String title;
  final String subtitle;
  final String note;
  final String allowButtonText;
  final String notNowButtonText;
  final VoidCallback? onAllowPressed;
  final VoidCallback? onNotNowPressed;

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
                style: AppTextStyle.font14TextMutedRegularTajawal(),
              ),
            ],
          ),
        ),
        verticalSpace(16),
        Text(
          note,
          textAlign: TextAlign.end,
          style: AppTextStyle.font14TextMutedRegularTajawal(),
        ),
        verticalSpace(24),
        CustomButton(
          onPressed: onAllowPressed,
          height: 48.h,
          background: ColorPalette.accent,
          foreground: ColorPalette.textPrimary,
          borderRadius: 24.r,
          text: allowButtonText,
          textStyle: AppTextStyle.font14TextPrimaryBoldTajawal(),
        ),
        verticalSpace(12),
        Center(
          child: TextButton(
            onPressed: onNotNowPressed,
            child: Text(
              notNowButtonText,
              style: AppTextStyle.font16TextPrimaryBoldTajawal(),
            ),
          ),
        ),
      ],
    );
  }
}
