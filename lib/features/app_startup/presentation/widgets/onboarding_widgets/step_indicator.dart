import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/features/app_startup/model/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class StepIndicator extends StatelessWidget {
  const StepIndicator({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: index,
      count: onboardingPages.length,
      axisDirection: Axis.horizontal,
      effect: const ExpandingDotsEffect(
        spacing: 8.0,
        dotWidth: 10,
        dotHeight: 10,
        radius: 56,
        paintStyle: PaintingStyle.fill,
        strokeWidth: 1.5,
        activeDotColor: ColorPalette.accent,
        dotColor: ColorPalette.white,
      ),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
