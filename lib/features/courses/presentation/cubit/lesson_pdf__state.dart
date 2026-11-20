import 'dart:typed_data';

import 'package:bta3_physia/core/errors/error_model/app_error_model.dart';

sealed class LessonPdfState {
  const LessonPdfState();
}

final class LessonPdfInitial extends LessonPdfState {
  const LessonPdfInitial();
}

final class LessonPdfLoading extends LessonPdfState {
  const LessonPdfLoading();
}

final class LessonPdfEmpty extends LessonPdfState {
  const LessonPdfEmpty();
}

final class LessonPdfSuccess extends LessonPdfState {
  final Uint8List pdfBytes;

  const LessonPdfSuccess({required this.pdfBytes});
}

final class LessonPdfFailure extends LessonPdfState {
  final AppErrorModel error;

  const LessonPdfFailure({required this.error});
}
