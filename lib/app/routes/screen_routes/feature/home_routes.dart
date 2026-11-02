import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

abstract final class HomeRoutes {
  const HomeRoutes._();

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.homeScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return const HomeScreen();
          },
        );

      default:
        return null;
    }
  }
}
