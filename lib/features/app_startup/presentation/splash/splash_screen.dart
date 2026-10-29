import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/animations/splash.json',
          width: double.infinity,
          fit: BoxFit.fill,
          repeat: false,
          onLoaded: (composition) {
            Future.delayed(
              composition.duration + const Duration(milliseconds: 800),
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
