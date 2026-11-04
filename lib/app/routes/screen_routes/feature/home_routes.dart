import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/features/home/presentation/cubit/home_state.dart';
import 'package:bta3_physia/features/home/presentation/screens/home_screen.dart';
import 'package:bta3_physia/features/notifications/presentation/cubit/notifications_state.dart';
import 'package:bta3_physia/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:flutter/material.dart';

abstract final class HomeRoutes {
  const HomeRoutes._();

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.homeScreen:
        HomeViewMode initialMode = HomeViewMode.contentWithLive;
        final Object? arguments = settings.arguments;
        if (arguments is HomeViewMode) {
          initialMode = arguments;
        }

        return MaterialPageRoute(
          settings: settings,
          builder: (_) => HomeScreen(initialMode: initialMode),
        );

      case RouteNames.notificationsScreen:
        NotificationsViewMode initialMode = NotificationsViewMode.unavailable;
        NotificationFilter initialFilter = NotificationFilter.all;

        final Object? arguments = settings.arguments;
        if (arguments is NotificationsViewMode) {
          initialMode = arguments;
        } else if (arguments is NotificationFilter) {
          initialFilter = arguments;
        } else if (arguments is Map) {
          if (arguments['mode'] is NotificationsViewMode) {
            initialMode = arguments['mode'] as NotificationsViewMode;
          }
          if (arguments['filter'] is NotificationFilter) {
            initialFilter = arguments['filter'] as NotificationFilter;
          }
        }

        return MaterialPageRoute(
          settings: settings,
          builder: (_) => NotificationsScreen(
            initialMode: initialMode,
            initialFilter: initialFilter,
          ),
        );

      default:
        return null;
    }
  }
}
