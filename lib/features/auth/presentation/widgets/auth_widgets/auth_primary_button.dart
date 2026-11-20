import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthPrimaryButton extends StatelessWidget {
  const AuthPrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: onPressed,
      isLoading: isLoading,
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
            size: 22.r,
            color: ColorPalette.textPrimary,
          ),
        ],
      ),
    );
  }
}
