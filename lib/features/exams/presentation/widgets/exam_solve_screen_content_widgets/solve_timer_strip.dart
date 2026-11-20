import 'package:bta3_physia/core/helper/duration_label_helper.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SolveTimerStrip extends StatelessWidget {
  final Stream<Duration> remainingStream;
  const SolveTimerStrip({super.key, required this.remainingStream});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: ColorPalette.panelGlass,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: ColorPalette.fieldFill,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: StreamBuilder<Duration>(
              stream: remainingStream,
              initialData: Duration.zero,
              builder: (context, snapshot) => Text(
                formatRemainingTime(snapshot.data ?? Duration.zero),
                style: AppTextStyle.font20TextHighlightBoldTajawal(),
              ),
            ),
          ),
          horizontalSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'الوقت المتبقي',
                  textAlign: TextAlign.end,
                  style: AppTextStyle.font13TextLightBoldTajawal(),
                ),
                Text(
                  'تُحفظ إجاباتك على هذا جهاز',
                  textAlign: TextAlign.end,
                  style: AppTextStyle.font11TextMutedRegularTajawal(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
