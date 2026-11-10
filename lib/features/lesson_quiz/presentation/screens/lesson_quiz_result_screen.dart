import 'package:bta3_physia/core/helper/app_system_ui.dart';
import 'package:bta3_physia/core/widgets/background/app_screen_backdrop.dart';
import 'package:bta3_physia/features/lesson_quiz/presentation/widgets/lesson_quiz_result_screen_content_widgets/lesson_quiz_result_screen_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LessonQuizResultScreen extends StatelessWidget {
  const LessonQuizResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppSystemUi.dark(),
      child: AppScreenBackdrop(
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: const LessonQuizResultScreenContent(),
          ),
        ),
      ),
    );
  }
}
