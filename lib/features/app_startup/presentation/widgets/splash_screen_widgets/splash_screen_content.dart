import 'package:bta3_physia/app/routes/app_images_routes.dart';
import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/features/app_startup/presentation/cubit/app_startup_cubit.dart';
import 'package:bta3_physia/features/app_startup/presentation/cubit/app_startup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class SplashScreenContent extends StatefulWidget {
  const SplashScreenContent({super.key});

  @override
  State<SplashScreenContent> createState() => _SplashScreenContentState();
}

class _SplashScreenContentState extends State<SplashScreenContent>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  bool _animationFinished = false;
  bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  Future<void> _playAnimation(LottieComposition composition) async {
    if (_controller.duration != null) return;

    _controller.duration = composition.duration * 2;

    try {
      await _controller.forward().orCancel;
    } on TickerCanceled {
      return;
    }

    await Future<void>.delayed(const Duration(milliseconds: 600));

    if (!mounted) return;

    _animationFinished = true;
    _navigateIfReady(context.read<AppStartupCubit>().state);
  }

  void _navigateIfReady(AppStartupState state) {
    if (!_animationFinished || _hasNavigated) return;

    final route = switch (state) {
      OnboardingRequired() => RouteNames.onboardingScreen,
      AppStartupContinue() => RouteNames.loginScreen,
      _ => null,
    };

    if (route == null) return;

    _hasNavigated = true;
    Navigator.of(context).pushReplacementNamed(route);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppStartupCubit, AppStartupState>(
      listener: (_, state) => _navigateIfReady(state),
      child: Center(
        child: Lottie.asset(
          AppImage().splash,
          controller: _controller,
          width: double.infinity,
          fit: BoxFit.fill,
          onLoaded: _playAnimation,
        ),
      ),
    );
  }
}
