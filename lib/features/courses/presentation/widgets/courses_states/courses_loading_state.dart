import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CoursesLoadingState extends StatelessWidget {
  const CoursesLoadingState({super.key, this.itemCount = 3});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      separatorBuilder: (_, __) => verticalSpace(16),
      itemBuilder: (_, __) => const _CourseCardShimmer(),
    );
  }
}

class _CourseCardShimmer extends StatelessWidget {
  const _CourseCardShimmer();

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _bar(height: 168.h, radius: 16.r),
            verticalSpace(12),
            _bar(width: 220.w, height: 24.h, radius: 8.r),
            verticalSpace(12),
            _bar(width: 280.w, height: 18.h, radius: 8.r),
            verticalSpace(12),
            _bar(height: 36.h, radius: 10.r),
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
