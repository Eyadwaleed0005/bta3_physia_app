import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:flutter/material.dart';

/// Placeholder for the auth handoff ("04 · الدخول / Auth handoff" in Figma).
///
/// Onboarding's skip button replaces itself with this route, so there is
/// always somewhere to land. The real form is not built yet — replace the body
/// without touching the route registration.
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.screenBackground,
      body: Center(
        child: Text(
          'تسجيل الدخول',
          textDirection: TextDirection.rtl,
          style: AppTextStyle.font18TextLightBoldTajawal(),
        ),
      ),
    );
  }
}