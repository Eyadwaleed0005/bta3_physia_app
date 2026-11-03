import 'package:bta3_physia/core/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// The success checkmark shown on the register-complete screen.
///
/// Two concentric circles (outer ring + inner filled disc) plus a Flutter
/// [Icon] checkmark — no canvas painting needed.
class RegisterSuccessMark extends StatelessWidget {
  const RegisterSuccessMark({super.key});

  static const double _outerSize = 192;
  static const double _innerSize = 96;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _outerSize.r,
      height: _outerSize.r,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // Outer translucent ring
          Container(
            width: _outerSize.r,
            height: _outerSize.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorPalette.accent.withValues(alpha: 0.07),
              border: Border.all(
                color: ColorPalette.accent.withValues(alpha: 0.22),
                width: 1.r,
              ),
            ),
          ),
          // Inner filled disc
          Container(
            width: _innerSize.r,
            height: _innerSize.r,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ColorPalette.accent,
            ),
            child: Center(
              child: Icon(
                Icons.check_rounded,
                size: 42.r,
                color: ColorPalette.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
