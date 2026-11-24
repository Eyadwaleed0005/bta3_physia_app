import 'package:bta3_physia/app/dependency_injection/service_locator.dart';
import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/core/helper/app_system_ui.dart';
import 'package:bta3_physia/features/app_startup/presentation/cubit/app_startup_cubit.dart';
import 'package:bta3_physia/features/app_startup/presentation/cubit/app_startup_state.dart';
import 'package:bta3_physia/features/app_startup/presentation/widgets/onboarding_widgets/onboarding_screen_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppStartupCubit>(
      create: (_) => getIt<AppStartupCubit>(),
      child: BlocListener<AppStartupCubit, AppStartupState>(
        listenWhen: (_, current) => current is AppStartupContinue,
        listener: (context, _) {
          Navigator.of(context).pushReplacementNamed(RouteNames.loginScreen);
        },
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: AppSystemUi.dark(),
          child: const Scaffold(
            backgroundColor: Colors.transparent,
            body: OnboardingScreenContent(),
          ),
        ),
      ),
    );
  }
}
