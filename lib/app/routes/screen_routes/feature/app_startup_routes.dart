import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/features/app_startup/presentation/screens/onboarding_screen.dart';
import 'package:bta3_physia/features/app_startup/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

abstract final class AppStartupRoutes {
  const AppStartupRoutes._();

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return const SplashScreen();
          },
        );

      case RouteNames.onboardingScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return OnboardingScreen();
          },
        );

      default:
        return null;
    }
  }
}
