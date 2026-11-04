import 'package:bta3_physia/core/helper/app_system_ui.dart';
import 'package:bta3_physia/core/widgets/app_screen_backdrop.dart';
import 'package:bta3_physia/features/exams/presentation/widgets/exams_screen_content_widgets/exams_screen_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExamsScreen extends StatelessWidget {
  const ExamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppSystemUi.dark(),
      child: AppScreenBackdrop(
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: ExamsScreenContent(),
          ),
        ),
      ),
    );
  }
}
