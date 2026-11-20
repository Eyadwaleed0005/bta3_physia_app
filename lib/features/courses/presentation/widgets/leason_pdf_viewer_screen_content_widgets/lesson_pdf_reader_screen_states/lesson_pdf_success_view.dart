import 'dart:typed_data';

import 'package:bta3_physia/features/courses/presentation/widgets/leason_pdf_viewer_screen_content_widgets/lesson_pdf_document_viewer.dart';
import 'package:flutter/material.dart';

class LessonPdfSuccessView extends StatelessWidget {
  const LessonPdfSuccessView({super.key, required this.pdfBytes});

  final Uint8List pdfBytes;

  @override
  Widget build(BuildContext context) {
    return LessonPdfDocumentViewer(pdfBytes: pdfBytes);
  }
}
