import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class NotificationsLoadingState extends StatelessWidget {
  const NotificationsLoadingState({super.key, this.itemCount = 3});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: itemCount,
          separatorBuilder: (_, __) => verticalSpace(16),
          itemBuilder: (_, __) => const _NotificationsCardShimmer(),
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

class _NotificationsCardShimmer extends StatelessWidget {
  const _NotificationsCardShimmer();

  @override
  Widget build(BuildContext context) {
    final baseColor = ColorPalette.panelGlass;
    final highlightColor = ColorPalette.teal400.withValues(alpha: 0.5);

    return Container(
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: ColorPalette.fieldFill,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _bar(height: 14.h, width: 220.w, radius: 8.r),
                verticalSpace(12),
                _bar(width: 250.w, height: 14.h, radius: 8.r),
                verticalSpace(12),
                _bar(width: 190.w, height: 14.h, radius: 8.r),
              ],
            ),
            horizontalSpace(16),
            _bar(height: 42.h, width: 32.w, radius: 8.r),
          ],
        ),
      ),
    );
  }

  Widget _bar({double? width, required double height, required double radius}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
