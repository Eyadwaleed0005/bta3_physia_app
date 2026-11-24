import 'package:bta3_physia/app/dependency_injection/service_locator.dart';
import 'package:bta3_physia/core/helper/app_system_ui.dart';
import 'package:bta3_physia/features/app_startup/presentation/cubit/app_startup_cubit.dart';
import 'package:bta3_physia/features/app_startup/presentation/widgets/splash_screen_widgets/splash_screen_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppStartupCubit>(
      lazy: false,
      create: (_) => getIt<AppStartupCubit>()..checkOnboarding(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: AppSystemUi.dark(),
        child: const Scaffold(body: SplashScreenContent()),
      ),
    );
  }
}
