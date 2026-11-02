import 'package:bta3_physia/core/helper/app_system_ui.dart';
import 'package:bta3_physia/features/app_startup/presentation/widgets/splash_screen_widgets/splash_screen_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppSystemUi.dark(),
      child: Scaffold(body: SplashScreenContent()),
    );
  }
}
