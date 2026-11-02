import 'package:bta3_physia/core/style/app_color.dart';
import 'package:flutter/material.dart';

class AuthBackdrop extends StatelessWidget {
  const AuthBackdrop({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: ColorPalette.screenBackground,
      child: Stack(
        children: [
          const Positioned.fill(
            child: IgnorePointer(
              child: CustomPaint(painter: _AmbientPainter()),
            ),
          ),
          child,
        ],
      ),
    );
  }
}

class _AmbientPainter extends CustomPainter {
  const _AmbientPainter();

  @override
  void paint(Canvas canvas, Size size) {
    _glow(
      canvas,
      center: Offset(size.width * 0.86, size.height * 0.08),
      radius: size.width * 0.62,
      color: ColorPalette.corona,
      opacity: 0.14,
    );
    _glow(
      canvas,
      center: Offset(size.width * 0.06, size.height * 0.62),
      radius: size.width * 0.55,
      color: ColorPalette.teal200,
      opacity: 0.10,
    );
    _glow(
      canvas,
      center: Offset(size.width * 0.50, size.height * 1.06),
      radius: size.width * 0.72,
      color: ColorPalette.teal700,
      opacity: 0.30,
    );
  }

  void _glow(
    Canvas canvas, {
    required Offset center,
    required double radius,
    required Color color,
    required double opacity,
  }) {
    final Rect bounds = Rect.fromCircle(center: center, radius: radius);

    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..shader = RadialGradient(
          colors: <Color>[
            color.withValues(alpha: opacity),
            color.withValues(alpha: 0),
          ],
        ).createShader(bounds),
    );
  }

  @override
  bool shouldRepaint(covariant _AmbientPainter oldDelegate) => false;
}
