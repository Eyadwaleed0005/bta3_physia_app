import 'package:bta3_physia/app/dependency_injection/service_locator.dart';
import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/features/live/presentation/cubit/live_cubit.dart';
import 'package:bta3_physia/features/live/presentation/screens/live_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract final class LiveRoutes {
  const LiveRoutes._();

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.liveScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider<LiveCubit>(
            create: (context) => getIt<LiveCubit>(),
            child: LiveScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
