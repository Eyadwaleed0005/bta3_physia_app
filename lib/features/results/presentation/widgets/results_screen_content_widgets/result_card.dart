import 'package:bta3_physia/core/helper/arabic_numbers_helper.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/features/results/data/models/exam_result_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultCard extends StatelessWidget {
  final ExamResultModel result;
  final VoidCallback onTap;

  const ResultCard({super.key, required this.result, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: ColorPalette.panelGlass,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: ColorPalette.fieldFill,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text(
                    '${toArabicNumbers(result.score)} / ${toArabicNumbers(result.totalDegrees)}',
                    style: AppTextStyle.font14TextHighlightBoldTajawal(),
                  ),
                ),
                horizontalSpace(12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        result.examTitle,
                        textAlign: TextAlign.end,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.font16TextLightBoldTajawal(),
                      ),
                      verticalSpace(4),
                      Text(
                        result.submittedAt,
                        textAlign: TextAlign.end,
                        style: AppTextStyle.font12TextMutedRegularTajawal(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            verticalSpace(12),
            ClipRRect(
              borderRadius: BorderRadius.circular(2.r),
              child: Container(
                height: 4.h,
                color: ColorPalette.fieldFill,
                child: FractionallySizedBox(
                  alignment: AlignmentDirectional.centerEnd,
                  widthFactor: result.percentage.clamp(0.0, 1.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorPalette.accent,
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
