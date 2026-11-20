import 'dart:ui' as ui;

import 'package:bta3_physia/app/routes/app_images_routes.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ElectricTransition extends StatelessWidget {
  const ElectricTransition({
    super.key,
    required this.animation,
    required this.secondaryAnimation,
    required this.child,
  });

  static const Duration duration = Duration(milliseconds: 500);

  static const double _surgeStart = 0.02;
  static const double _surgeEnd = 0.45;
  static const double _flashStart = 0.45;
  static const double _flashEnd = 0.55;
  static const double _revealStart = 0.55;
  static const double _revealEnd = 0.93;

  //static const double _coveredOpacity = 0.12;

  final Animation<double> animation;
  final Animation<double> secondaryAnimation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final surge = _drive(animation, _surgeStart, _surgeEnd, Curves.easeInOut);
    final flash = _drive(animation, _flashStart, _flashEnd, Curves.easeOut);
    final reveal = _drive(
      animation,
      _revealStart,
      _revealEnd,
      Curves.easeInOut,
    );

    final covered = _drive(
      secondaryAnimation,
      _surgeStart,
      _surgeEnd,
      Curves.easeInOut,
    );

    final bgColor = ColorPalette.primary;

    return Stack(
      children: [
        Positioned.fill(
          child: AnimatedBuilder(
            animation: reveal,
            builder: (_, _) => Opacity(
              opacity: reveal.value,
              child: ColoredBox(color: bgColor),
            ),
          ),
        ),
        AnimatedBuilder(
          animation: Listenable.merge([reveal, covered]),
          builder: (_, child) => Opacity(
            opacity: (reveal.value * (1 - covered.value)).clamp(0.0, 1.0),
            child: child,
          ),
          child: child,
        ),
        Positioned.fill(
          child: IgnorePointer(
            child: _ElectricBurst(surge: surge, flash: flash, reveal: reveal),
          ),
        ),
      ],
    );
  }

  static Animation<double> _drive(
    Animation<double> parent,
    double begin,
    double end,
    Curve curve,
  ) {
    return parent.drive(CurveTween(curve: Interval(begin, end, curve: curve)));
  }
}

class _ElectricBurst extends StatelessWidget {
  const _ElectricBurst({
    required this.surge,
    required this.flash,
    required this.reveal,
  });

  final Animation<double> surge;
  final Animation<double> flash;
  final Animation<double> reveal;

  static const double _designWidth = 390;
  static String surgeTop = AppImage().surgeTop;
  static String surgeRight = AppImage().surgeRight;
  static String surgeBottom = AppImage().surgeBottom;
  static String surgeLeft = AppImage().surgeLeft;

  static final _surgeSpecs = <_SurgeSpec>[
    _SurgeSpec(surgeRight, 381.891, 57.1895, _Edge.right),
    _SurgeSpec(surgeLeft, 381.19, 52.96, _Edge.left),
    _SurgeSpec(surgeTop, 67.7798, 381.189, _Edge.top),
    _SurgeSpec(surgeBottom, 58.5996, 381.189, _Edge.bottom),
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([surge, flash, reveal]),
      builder: (context, _) {
        if (surge.value == 1 && flash.value == 1 && reveal.value == 1) {
          return const SizedBox.shrink();
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            final size = constraints.biggest;
            final scale = size.width / _designWidth;
            final center = Offset(size.width / 2, size.height / 2);
            final distance = 180 * scale;

            final surgeOpacity = (0.9 + 0.1 * surge.value) * (1 - reveal.value);
            final flashOpacity = flash.value * (1 - reveal.value);

            return Stack(
              fit: StackFit.expand,
              children: [
                if (flashOpacity > 0)
                  Center(
                    child: Opacity(
                      opacity: flashOpacity * 0.7,
                      child: Container(
                        width: ui.lerpDouble(46, 200, flash.value)! * scale,
                        height: ui.lerpDouble(12, 140, flash.value)! * scale,
                        decoration: BoxDecoration(
                          gradient: RadialGradient(
                            radius: 0.5,
                            colors: const [
                              Color(0xFFFFFFFF),
                              Color(0xFAF0FFFF),
                              Color(0x73A6F2FF),
                              Color(0x73A6F2FF),
                              Color(0x0069DEFF),
                            ],
                            stops: const [0, 0.34, 0.65, 0.80, 1],
                          ),
                        ),
                      ),
                    ),
                  ),
                ..._surgeSpecs.map(
                  (spec) => _buildSurge(
                    spec: spec,
                    size: size,
                    center: center,
                    distance: distance,
                    scale: scale,
                    surgeProgress: surge.value,
                    opacity: surgeOpacity,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildSurge({
    required _SurgeSpec spec,
    required Size size,
    required Offset center,
    required double distance,
    required double scale,
    required double surgeProgress,
    required double opacity,
  }) {
    final width = spec.width * scale;
    final height = spec.height * scale;

    Offset startPos, endPos;
    switch (spec.edge) {
      case _Edge.right:
        startPos = Offset(size.width + distance + 25 * scale, center.dy);
        endPos = Offset(center.dx + distance, center.dy);
        break;
      case _Edge.left:
        startPos = Offset(-(distance + 25 * scale), center.dy);
        endPos = Offset(center.dx - distance, center.dy);
        break;
      case _Edge.top:
        startPos = Offset(center.dx, -(distance + 38 * scale));
        endPos = Offset(center.dx, center.dy - distance);
        break;
      case _Edge.bottom:
        startPos = Offset(center.dx, size.height + distance + 38 * scale);
        endPos = Offset(center.dx, center.dy + distance);
        break;
    }

    final currentPos = Offset.lerp(startPos, endPos, surgeProgress)!;

    return Positioned(
      left: currentPos.dx - width / 2,
      top: currentPos.dy - height / 2,
      width: width,
      height: height,
      child: Opacity(
        opacity: opacity,
        child: _SurgeArtwork(asset: spec.asset, width: width, height: height),
      ),
    );
  }
}

class _SurgeArtwork extends StatelessWidget {
  const _SurgeArtwork({
    required this.asset,
    required this.width,
    required this.height,
  });

  final String asset;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final svg = SvgPicture.asset(asset, width: width, height: height);
    final sigma = 5 * (width / 381.891);

    return Stack(
      fit: StackFit.expand,
      children: [
        ImageFiltered(
          imageFilter: ui.ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(ColorPalette.corona, BlendMode.srcIn),
            child: svg,
          ),
        ),
        svg,
      ],
    );
  }
}

class _SurgeSpec {
  const _SurgeSpec(this.asset, this.width, this.height, this.edge);

  final String asset;
  final double width;
  final double height;
  final _Edge edge;
}

enum _Edge { top, right, bottom, left }
