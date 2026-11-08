import 'package:bta3_physia/core/style/app_color.dart';
import 'package:flutter/material.dart';

class AppScreenBackdrop extends StatelessWidget {
  const AppScreenBackdrop({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(color: ColorPalette.screenBackground, child: child);
  }
}
