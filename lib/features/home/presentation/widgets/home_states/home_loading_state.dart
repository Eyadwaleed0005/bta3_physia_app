import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class HomeLoadingState extends StatelessWidget {
  const HomeLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    final baseColor = ColorPalette.fieldFill;
    final highlightColor = ColorPalette.teal400;

    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Subtitle
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'جارٍ تحميل محتوى صفّك...',
              style: AppTextStyle.font14TextMutedRegularTajawal(),
            ),
          ),
          verticalSpace(14),

          // Live Shimmer Card
          Container(
            height: 92.h,
            decoration: BoxDecoration(
              color: baseColor,
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),

          verticalSpace(16),

          // 3 Quick Action Shimmer Cards
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 78.h,
                  decoration: BoxDecoration(
                    color: baseColor,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
              ),
              horizontalSpace(12),
              Expanded(
                child: Container(
                  height: 78.h,
                  decoration: BoxDecoration(
                    color: baseColor,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
              ),
              horizontalSpace(12),
              Expanded(
                child: Container(
                  height: 78.h,
                  decoration: BoxDecoration(
                    color: baseColor,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
              ),
            ],
          ),

          verticalSpace(20),

          // Section Title Shimmer
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 140.w,
              height: 22.h,
              decoration: BoxDecoration(
                color: baseColor,
                borderRadius: BorderRadius.circular(6.r),
              ),
            ),
          ),

          verticalSpace(14),

          // Course Card Shimmer
          Container(
            height: 230.h,
            decoration: BoxDecoration(
              color: baseColor,
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
        ],
      ),
    );
  }
}

