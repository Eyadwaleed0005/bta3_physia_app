import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/features/app_startup/model/onboarding_model.dart';
import 'package:bta3_physia/features/app_startup/presentation/widgets/onboarding_widgets/lottie_animation.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key, required this.page, required this.isActive});

  final OnboardingModel page;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: LottieAnimation(asset: page.animation, isActive: isActive),
        ),
        Text(
          page.caption,
          textAlign: TextAlign.center,
          style: AppTextStyle.font16TextSecondaryBoldTajawal().copyWith(
            color: page.captionColor,
          ),
        ),
        verticalSpace(32),
        if (page.eyebrow case final String eyebrow) ...[
          Text(
            eyebrow,
            textAlign: TextAlign.center,
            style: AppTextStyle.font14TextSecondaryBoldTajawal(),
          ),
          verticalSpace(8),
        ],
        Text(
          page.heading,
          textAlign: TextAlign.center,
          style: AppTextStyle.font29TextLightBoldAlexandria(),
        ),
        verticalSpace(8),
        Text(
          page.supporting,
          textAlign: TextAlign.center,
          style: AppTextStyle.font18TextMutedRegularTajawal(),
        ),
      ],
    );
  }
}
