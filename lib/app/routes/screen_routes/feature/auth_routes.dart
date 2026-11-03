import 'package:bta3_physia/app/dependency_injection/service_locator.dart';
import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/core/style/app_animations.dart';
import 'package:bta3_physia/core/transition/electric_transition.dart';
import 'package:bta3_physia/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:bta3_physia/features/auth/presentation/cubit/register_cubit/register_cubit.dart';
import 'package:bta3_physia/features/auth/presentation/screens/login/login_screen.dart';
import 'package:bta3_physia/features/auth/presentation/screens/register/register_screen.dart';
import 'package:bta3_physia/features/auth/presentation/screens/register/register_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract final class AuthRoutes {
  const AuthRoutes._();

  static PageRouteBuilder<void> electricRoute({
    required Widget screen,
    RouteSettings? settings,
  }) {
    return PageRouteBuilder<void>(
      settings: settings,
      transitionDuration: ElectricTransition.duration,
      reverseTransitionDuration: ElectricTransition.duration,
      pageBuilder: (_, __, ___) => screen,
      transitionsBuilder:
          (
            _,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return ElectricTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
    );
  }

  static Route<dynamic> simpleRoute({
    required Widget screen,
    RouteSettings? settings,
  }) {
    return AppAnimations.screenFade(screen: screen, duration: 380);
  }

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final bool skipElectric =
        settings.arguments is Map<String, dynamic> &&
        (settings.arguments
                as Map<String, dynamic>)['skipElectricTransition'] ==
            true;

    final Route<dynamic> Function({
      required Widget screen,
      RouteSettings? settings,
    })
    routeBuilder = skipElectric ? simpleRoute : electricRoute;

    switch (settings.name) {
      case RouteNames.loginScreen:
        return routeBuilder(
          settings: settings,
          screen: BlocProvider<LoginCubit>(
            create: (_) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );

      case RouteNames.registerScreen:
        return routeBuilder(
          settings: settings,
          screen: BlocProvider<RegisterCubit>(
            create: (_) => getIt<RegisterCubit>(),
            child: const RegisterScreen(),
          ),
        );

      case RouteNames.registerSuccessScreen:
        return routeBuilder(
          settings: settings,
          screen: const RegisterSuccessScreen(),
        );

      default:
        return null;
    }
  }
}
