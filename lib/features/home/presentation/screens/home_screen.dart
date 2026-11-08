import 'package:bta3_physia/core/helper/app_system_ui.dart';
import 'package:bta3_physia/core/widgets/background/app_screen_backdrop.dart';
import 'package:bta3_physia/features/home/presentation/cubit/home_state.dart';
import 'package:bta3_physia/features/home/presentation/widgets/home_screen_content_widgets/home_screen_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.initialMode = HomeViewMode.contentNoLive});

  final HomeViewMode initialMode;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppSystemUi.dark(),
      child: AppScreenBackdrop(child: const HomeScreenContent()),
    );
  }
}
