import 'package:bta3_physia/core/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthBackButton extends StatelessWidget {
  const AuthBackButton({
    super.key,
    required this.onPressed,
    this.semanticLabel,
  });

  final VoidCallback? onPressed;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: semanticLabel ?? 'رجوع',
      child: Material(
        color: ColorPalette.fieldFill,
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          child: SizedBox(
            width: 44.r,
            height: 44.r,
            child: Icon(
              Icons.arrow_forward_ios,
              size: 22.r,
              color: ColorPalette.textMuted,
            ),
          ),
        ),
      ),
    );
  }
}
