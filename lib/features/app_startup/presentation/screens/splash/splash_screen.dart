import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/animations/splash.json',
          controller: _controller,
          width: double.infinity,
          fit: BoxFit.fill,
          onLoaded: (composition) {
            _controller.duration = composition.duration * 2;

            _controller.forward();

            Future.delayed(
              _controller.duration! + const Duration(milliseconds: 600),
              () {
                if (context.mounted) {
                  Navigator.of(context).pushNamed(RouteNames.onBoardingScreen);
                }
              },
            );
          },
        ),
      ),
    );
  }
}
