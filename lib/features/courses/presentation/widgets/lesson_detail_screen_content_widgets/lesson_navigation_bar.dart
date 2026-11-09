import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LessonNavigationBar extends StatelessWidget {
  const LessonNavigationBar({
    super.key,
    required this.hasPrevious,
    required this.hasNext,
    required this.onPrevious,
    required this.onNext,
    required this.onBackToLessons,
  });

  final bool hasPrevious;
  final bool hasNext;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final VoidCallback onBackToLessons;

  @override
  Widget build(BuildContext context) {
    /* if (!hasPrevious) {
      return _PrimaryButton(
        text: hasNext ? 'الدرس التالي' : 'قائمة الدروس',
        onPressed: hasNext ? onNext : onBackToLessons,
      );
    } */

    return Row(
      children: [
        Expanded(
          child: CustomButton(
            onPressed: hasPrevious ? onPrevious : onBackToLessons,
            height: 48.h,
            background: ColorPalette.panelGlass,
            foreground: ColorPalette.textLight,
            borderRadius: 24.r,
            text: hasPrevious ? 'الدرس السابق' : 'قائمة الدروس',
            textStyle: AppTextStyle.font14TextLightBoldTajawal(),
          ),
        ),
        horizontalSpace(10),
        Expanded(
          child: _PrimaryButton(
            text: hasNext ? 'الدرس التالي' : 'قائمة الدروس',
            onPressed: hasNext ? onNext : onBackToLessons,
          ),
        ),
      ],
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton({required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: onPressed,
      height: 48.h,
      background: ColorPalette.panelGlass,
      foreground: ColorPalette.textLight,
      borderRadius: 24.r,
      text: text,
      //textStyle: AppTextStyle.font14TextLightBoldTajawal(),
    );
  }
}
