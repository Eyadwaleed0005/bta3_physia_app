import 'package:bta3_physia/app/routes/app_images_routes.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthBrandMark extends StatefulWidget {
  const AuthBrandMark({super.key, this.height = 54, this.showHalo = false});

  final double height;
  final bool showHalo;

  @override
  State<AuthBrandMark> createState() => _AuthBrandMarkState();
}

class _AuthBrandMarkState extends State<AuthBrandMark>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double>
  _scale = TweenSequence<double>(<TweenSequenceItem<double>>[
    TweenSequenceItem<double>(tween: Tween(begin: 1.0, end: 0.95), weight: 40),
    TweenSequenceItem<double>(tween: ConstantTween<double>(0.95), weight: 10),
    TweenSequenceItem<double>(tween: Tween(begin: 0.95, end: 1.0), weight: 40),
    TweenSequenceItem<double>(tween: ConstantTween<double>(1.0), weight: 10),
  ]).animate(_animationController);

  late final Animation<double>
  _borderOpacity = TweenSequence<double>(<TweenSequenceItem<double>>[
    TweenSequenceItem<double>(tween: Tween(begin: 0.4, end: 0.05), weight: 40),
    TweenSequenceItem<double>(tween: ConstantTween<double>(0.05), weight: 10),
    TweenSequenceItem<double>(tween: Tween(begin: 0.05, end: 0.4), weight: 40),
    TweenSequenceItem<double>(tween: ConstantTween<double>(0.4), weight: 10),
  ]).animate(_animationController);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );

    if (widget.showHalo) {
      _animationController.repeat();
    }
  }

  @override
  void didUpdateWidget(AuthBrandMark oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.showHalo != oldWidget.showHalo) {
      if (widget.showHalo) {
        _animationController.repeat();
      } else {
        _animationController.stop();
        _animationController.reset();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Widget mark = SvgPicture.asset(
      AppImage().wordMark,
      height: widget.height.h,
    );

    if (!widget.showHalo) {
      return mark;
    }

    return AnimatedBuilder(
      animation: _scale,
      builder: (BuildContext context, Widget? child) {
        return Transform.scale(scale: _scale.value, child: child!);
      },
      child: SizedBox(
        height: 154.h,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            AnimatedBuilder(
              animation: _borderOpacity,
              builder: (BuildContext context, Widget? child) {
                return Container(
                  width: 154.r,
                  height: 154.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: ColorPalette.teal200.withValues(
                        alpha: (_borderOpacity.value * 0.4) + 0.07,
                      ),
                      width: 1.5.r,
                    ),
                  ),
                );
              },
            ),
            mark,
          ],
        ),
      ),
    );
  }
}
