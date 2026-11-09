import 'package:bta3_physia/core/helper/app_system_ui.dart';
import 'package:bta3_physia/core/widgets/background/app_screen_backdrop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LessonsQuizContent extends StatelessWidget {
  const LessonsQuizContent({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppSystemUi.dark(),
      child: AppScreenBackdrop(
        child: Center(
          child: Text('Lesson Quiz', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
