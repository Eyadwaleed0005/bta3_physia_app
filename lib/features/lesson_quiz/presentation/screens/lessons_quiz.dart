import 'package:bta3_physia/core/helper/app_system_ui.dart';
import 'package:bta3_physia/core/widgets/background/app_screen_backdrop.dart';
import 'package:bta3_physia/features/lesson_quiz/presentation/widgets/lessons_quiz_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LessonsQuiz extends StatelessWidget {
  const LessonsQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppSystemUi.dark(),
      child: Scaffold(
        body: AppScreenBackdrop(child: const LessonsQuizContent()),
      ),
    );
  }
}
