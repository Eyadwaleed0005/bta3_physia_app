import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/widgets/app_loading_indicator.dart';
import 'package:bta3_physia/features/courses/presentation/widgets/leason_pdf_viewer_screen_content_widgets/lesson_pdf_state_layout.dart';
import 'package:flutter/material.dart';

class LessonPdfLoadingView extends StatelessWidget {
  const LessonPdfLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.orientationOf(context) == Orientation.landscape;

    return LessonPdfStateLayout(
      child: Center(
        child: AppLoadingIndicator(
          color: ColorPalette.primary,
          size: isLandscape ? 26 : 36,
          strokeWidth: isLandscape ? 2.5 : 3,
        ),
      ),
    );
  }
}
