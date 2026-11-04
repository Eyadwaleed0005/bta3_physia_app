import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class NotificationsLoadingState extends StatelessWidget {
  const NotificationsLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    final baseColor = ColorPalette.fieldFill;
    final highlightColor = ColorPalette.teal400;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Shimmer.fromColors(
          baseColor: baseColor,
          highlightColor: highlightColor,
          child: Column(
            children: List.generate(
              4,
              (index) => Container(
                height: 86.h,
                margin: EdgeInsets.only(bottom: 12.h),
                decoration: BoxDecoration(
                  color: baseColor,
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
            ),
          ),
        ),
        verticalSpace(16),
        CustomButton(
          onPressed: () {},
          height: 48.h,
          background: ColorPalette.accent,
          foreground: ColorPalette.textPrimary,
          borderRadius: 24.r,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'جارٍ تحميل الإشعارات',
                style: AppTextStyle.font16TextPrimaryBoldTajawal(),
              ),
              horizontalSpace(8),

              Icon(
                Icons.refresh_rounded,
                size: 20.r,
                color: ColorPalette.textPrimary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
