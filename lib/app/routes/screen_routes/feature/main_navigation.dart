import 'package:bta3_physia/app/routes/screen_routes/feature/auth_routes.dart';
import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/features/main_navigation/presentation/screens/main_navigation_screen.dart';
import 'package:flutter/material.dart';

abstract final class MainNavigationRoutes {
  const MainNavigationRoutes._();

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.mainNavigationScreen:
        final initialIndex = settings.arguments is int
            ? settings.arguments! as int
            : 0;

        return AuthRoutes.electricRoute(
          settings: settings,
          screen: MainNavigationScreen(initialIndex: initialIndex),
        );

      default:
        return null;
    }
  }
}
