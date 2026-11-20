import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required this.label,
    required this.scale,
    required this.onPressed,
  });

  final String label;
  final Animation<double> scale;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: scale,
      builder: (BuildContext context, Widget? child) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.diagonal3Values(scale.value, 1, 1),
          child: child,
        );
      },
      child: CustomButton(
        onPressed: onPressed,
        height: 60.h,
        background: ColorPalette.accent,
        foreground: ColorPalette.textPrimary,
        borderRadius: 22,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          textDirection: TextDirection.ltr,
          children: <Widget>[
            Text(label, style: AppTextStyle.font18TextPrimaryBoldTajawal()),
            horizontalSpace(12),
            Icon(
              Icons.arrow_forward,
              size: 18.r,
              color: ColorPalette.textPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
