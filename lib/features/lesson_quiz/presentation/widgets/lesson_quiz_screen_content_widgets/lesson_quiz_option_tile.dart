import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LessonQuizOptionTile extends StatelessWidget {
  final int index;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const LessonQuizOptionTile({
    super.key,
    required this.index,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Map<int, String> map = {
      0: "أ",
      1: "ب",
      2: "ج",
      3: "د",
      4: "هـ",
      5: "و",
      6: "ز",
      7: "ح",
      8: "ط",
      9: "ي",
      10: "ك",
      11: "ل",
    };
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        height: 50.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: ColorPalette.fieldFill,
          borderRadius: BorderRadius.circular(16.r),
          border: isSelected
              ? Border.all(color: ColorPalette.borderWarm, width: 1.5.w)
              : null,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.end,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.font14TextLightSemiBoldTajawal(),
              ),
            ),
            horizontalSpace(12),
            Text(
              map[index]!,
              style: AppTextStyle.font14TextSecondaryBoldTajawal(),
            ),
          ],
        ),
      ),
    );
  }
}
