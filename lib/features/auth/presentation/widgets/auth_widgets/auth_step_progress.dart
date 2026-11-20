import 'package:bta3_physia/core/helper/arabic_numbers_helper.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthStepProgress extends StatelessWidget {
  const AuthStepProgress({super.key, required this.step, required this.total});

  final int step;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          'الخطوة ${toArabicNumbers(step)} من ${toArabicNumbers(total)}',
          textAlign: TextAlign.right,
          style: AppTextStyle.font14TextSecondaryBoldTajawal(),
        ),
        verticalSpace(10),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            spacing: 8.w,
            children: List<Widget>.generate(
              total,
              (int index) => Expanded(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOutCubic,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: index < step
                        ? ColorPalette.accent
                        : ColorPalette.fieldBorder,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
