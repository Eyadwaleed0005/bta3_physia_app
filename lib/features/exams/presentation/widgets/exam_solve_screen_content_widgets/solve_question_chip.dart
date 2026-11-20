import 'package:bta3_physia/core/helper/arabic_numbers_helper.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SolveQuestionChip extends StatelessWidget {
  final int index;
  final bool isCurrent;
  final bool isAnswered;
  final VoidCallback onTap;
  final Key valueKey;

  const SolveQuestionChip({
    super.key,
    required this.index,
    required this.isCurrent,
    required this.isAnswered,
    required this.onTap,
    required this.valueKey,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: valueKey,
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        width: 42.w,
        height: 44.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ColorPalette.fieldFill,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: isCurrent ? 6.h : 0),
              child: Text(
                toArabicNumbers(index + 1),
                style: isAnswered || isCurrent
                    ? AppTextStyle.font13TextLightBoldTajawal()
                    : AppTextStyle.font13TextMutedRegularTajawal(),
              ),
            ),
            if (isCurrent)
              Container(
                width: 28.w,
                height: 3.h,
                decoration: BoxDecoration(
                  color: ColorPalette.accent,
                  borderRadius: BorderRadius.circular(3.r),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
