import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimation extends StatefulWidget {
  const LottieAnimation({
    super.key,
    required this.asset,
    required this.isActive,
  });

  final String asset;
  final bool isActive;

  @override
  State<LottieAnimation> createState() => _LottieAnimationState();
}

class _LottieAnimationState extends State<LottieAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  bool _loaded = false;

  @override
  void didUpdateWidget(covariant LottieAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive != oldWidget.isActive) {
      _sync();
    }
  }

  void _sync() {
    if (!_loaded) {
      return;
    }
    if (widget.isActive) {
      _controller.repeat();
    } else {
      _controller.stop();
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      widget.asset,
      controller: _controller,
      fit: BoxFit.contain,
      repeat: true,
      onLoaded: (LottieComposition composition) {
        _controller.duration = composition.duration * 1.5;
        _loaded = true;
        _sync();
      },
    );
  }
}
