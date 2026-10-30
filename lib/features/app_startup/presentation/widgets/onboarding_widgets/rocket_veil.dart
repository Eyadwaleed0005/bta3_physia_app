import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RocketVeil extends StatelessWidget {
  const RocketVeil({
    super.key,
    required this.color,
    required this.rise,
    required this.rocketAppear,
    required this.rocketFade,
    required this.veilFade,
  });

  final Color color;
  final Animation<double> rise;
  final Animation<double> rocketAppear;
  final Animation<double> rocketFade;
  final Animation<double> veilFade;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge(<Listenable>[
        rise,
        rocketAppear,
        rocketFade,
        veilFade,
      ]),
      builder: (BuildContext context, Widget? child) {
        return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double height = constraints.maxHeight;
            final double edge = height * (1 - rise.value);
            return Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                Positioned(
                  top: edge,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Opacity(
                    opacity: 1 - veilFade.value,
                    child: ColoredBox(color: color),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: height - edge,
                  child: Opacity(
                    opacity: rocketFade.value * (1 - veilFade.value),
                    child: Transform.scale(
                      scale: rocketAppear.value,
                      child: Center(
                        child: SizedBox(
                          width: 64.w,
                          height: 104.h,
                          child: SvgPicture.asset(
                            'assets/icons/Rocket.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
