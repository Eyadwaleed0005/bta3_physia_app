import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/features/auth/presentation/login/login_screen.dart';
import 'package:flutter/material.dart';

abstract final class AuthRoutes {
  const AuthRoutes._();

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.loginScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return const LoginScreen();
          },
        );

      default:
        return null;
    }
  }
}