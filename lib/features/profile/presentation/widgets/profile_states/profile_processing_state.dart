import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileProcessingState extends StatelessWidget {
  const ProfileProcessingState({
    super.key,
    this.title = 'جار تحميل حسابك',
    this.subtitle = 'يرجى الانتظار لحظات',
    this.buttonText = 'جار التنفيذ',
  });

  final String title;
  final String subtitle;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 28.h),
      decoration: BoxDecoration(
        color: ColorPalette.panelGlass,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(Icons.refresh, size: 60.r, color: ColorPalette.accent),
          verticalSpace(14),
          Text(title, style: AppTextStyle.font20TextLightBoldTajawal()),
          verticalSpace(14),
          Text(
            subtitle,
            textAlign: TextAlign.right,
            style: AppTextStyle.font14TextMutedRegularTajawal(),
          ),
          verticalSpace(20),
          CustomButton(
            isLoading: true,
            titleForRefreash: buttonText,
            height: 48.h,
            background: ColorPalette.accent,
            foreground: ColorPalette.textPrimary,
            borderRadius: 24.r,
          ),
        ],
      ),
    );
  }
}
