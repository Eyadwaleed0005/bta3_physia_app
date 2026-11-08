import 'package:bta3_physia/app/dependency_injection/service_locator.dart';
import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/features/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:bta3_physia/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract final class NotificationsRoutes {
  const NotificationsRoutes._();

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.notificationsScreen:

        // maybe need it when opening notifications from notification center

        /* NotificationsViewMode initialMode = NotificationsViewMode.unavailable;
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
        } */

        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider<NotificationsCubit>(
            create: (context) => getIt<NotificationsCubit>(),
            child: NotificationsScreen(
              /* initialMode: initialMode,
              initialFilter: initialFilter, */
            ),
          ),
        );

      default:
        return null;
    }
  }
}
