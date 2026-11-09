import 'package:bta3_physia/core/helper/app_system_ui.dart';
import 'package:bta3_physia/core/widgets/background/app_screen_backdrop.dart';
import 'package:bta3_physia/features/courses/presentation/widgets/courses_screen_content_widgets/courses_screen_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppSystemUi.dark(),
      child: AppScreenBackdrop(
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: const CoursesScreenContent(),
          ),
        ),
      ),
    );
  }
}
