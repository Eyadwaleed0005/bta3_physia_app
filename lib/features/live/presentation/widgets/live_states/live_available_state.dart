import 'package:bta3_physia/app/routes/app_images_routes.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LiveAvailableState extends StatelessWidget {
  const LiveAvailableState({
    super.key,
    required this.liveTitle,
    required this.teacher,

    this.onJoinPressed,
  });

  final String liveTitle;
  final String teacher;

  final VoidCallback? onJoinPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorPalette.panelGlass,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorPalette.fieldFill,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
            ),
            child: Column(
              children: [
                SvgPicture.asset(
                  height: 48.h,
                  width: 48.w,
                  AppImage().live,
                  colorFilter: ColorFilter.mode(
                    ColorPalette.accent,
                    BlendMode.srcIn,
                  ),
                ),
                verticalSpace(6),
                Text(
                  'بث مباشر الآن',
                  style: AppTextStyle.font13TextHighLightBoldTajawal(),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 28.h),
            decoration: BoxDecoration(
              color: ColorPalette.panelGlass,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(16.r),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,

              children: [
                Text(
                  liveTitle,
                  textAlign: TextAlign.right,
                  style: AppTextStyle.font20TextLightBoldTajawal(),
                ),
                verticalSpace(8),
                Text(
                  'مع $teacher',
                  textAlign: TextAlign.right,
                  style: AppTextStyle.font14TextMutedRegularTajawal(),
                ),
                verticalSpace(10),
                // Platform chip
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'عبر Zoom',
                      style: AppTextStyle.font13TextSecondaryBoldTajawal(),
                    ),
                    horizontalSpace(6),
                    Icon(
                      Icons.open_in_new_rounded,
                      color: ColorPalette.wine200,
                      size: 20.r,
                    ),
                  ],
                ),
                verticalSpace(14),
                Text(
                  'سيفتح البث في تطبيق Zoom خارج هذا التطبيق.',
                  textAlign: TextAlign.right,
                  style: AppTextStyle.font13TextMutedRegularTajawal(),
                ),
                verticalSpace(20),
                // Join button
                CustomButton(
                  onPressed: onJoinPressed,
                  height: 48.h,
                  background: ColorPalette.accent,
                  foreground: ColorPalette.textPrimary,
                  borderRadius: 24.r,
                  text: 'الانضمام إلى البث',
                  textStyle: AppTextStyle.font16TextPrimaryBoldTajawal(),
                ),
              ],
            ),
          ),

          // Session info
        ],
      ),
    );
  }
}
