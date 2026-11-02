import 'package:bta3_physia/app/dependency_injection/service_locator.dart';
import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/core/style/app_animations.dart';
import 'package:bta3_physia/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:bta3_physia/features/auth/presentation/cubit/register_cubit/register_cubit.dart';
import 'package:bta3_physia/features/auth/presentation/screens/login/login_screen.dart';
import 'package:bta3_physia/features/auth/presentation/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract final class AuthRoutes {
  const AuthRoutes._();

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.loginScreen:
        return AppAnimations.screenFade(
          screen: BlocProvider<LoginCubit>(
            create: (_) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
          duration: 380,
        );

      case RouteNames.registerScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return BlocProvider<RegisterCubit>(
              create: (_) => getIt<RegisterCubit>(),
              child: const RegisterScreen(),
            );
          },
        );

      default:
        return null;
    }
  }
}
