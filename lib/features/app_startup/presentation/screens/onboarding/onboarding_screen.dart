import 'package:bta3_physia/core/helper/app_system_ui.dart';
import 'package:bta3_physia/features/app_startup/presentation/widgets/onboarding_widgets/onboarding_screen_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppSystemUi.dark(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: OnboardingScreenContent(),
      ),
    );
  }
}
