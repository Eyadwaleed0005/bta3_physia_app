import 'package:bta3_physia/app/routes/app_images_routes.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AuthBackdrop extends StatelessWidget {
  const AuthBackdrop({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: ColorPalette.screenBackground,
      child: Stack(
        children: [
          Positioned.fill(
            child: IgnorePointer(
              child: Lottie.asset(
                AppImage().electricBackground,
                fit: BoxFit.cover,
                repeat: true,
                animate: true,
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
