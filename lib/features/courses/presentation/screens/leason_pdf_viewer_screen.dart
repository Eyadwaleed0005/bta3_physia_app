import 'package:bta3_physia/core/helper/app_system_ui.dart';
import 'package:bta3_physia/core/widgets/background/app_screen_backdrop.dart';
import 'package:bta3_physia/features/courses/presentation/widgets/leason_pdf_viewer_screen_content_widgets/lesson_pdf_reader_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LeasonPdfViewerScreen extends StatelessWidget {
  const LeasonPdfViewerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppSystemUi.dark(),
      child: AppScreenBackdrop(
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: const LessonPdfReaderContent(),
          ),
        ),
      ),
    );
  }
}
