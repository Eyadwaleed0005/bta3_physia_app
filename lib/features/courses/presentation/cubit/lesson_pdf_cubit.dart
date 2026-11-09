import 'dart:io';

import 'package:bta3_physia/core/errors/error_model/app_error_model.dart';
import 'package:bta3_physia/features/courses/presentation/cubit/lesson_pdf__state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonPdfCubit extends Cubit<LessonPdfState> {
  LessonPdfCubit({required this.title, required this.url})
    : super(const LessonPdfInitial()) {
    loadPdf();
  }

  //will be delivered from usecase
  final String title;
  final String url;

  //for test only
  Future<void> loadPdf() async {
    final trimmedUrl = url.trim();
    if (trimmedUrl.isEmpty) {
      emit(const LessonPdfEmpty());
      return;
    }

    emit(const LessonPdfLoading());

    HttpClient? client;
    try {
      final uri = Uri.parse(trimmedUrl);
      client = HttpClient();
      final request = await client.getUrl(uri);
      final response = await request.close();

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final bytes = await consolidateHttpClientResponseBytes(response);
        if (isClosed) return;

        if (bytes.isEmpty) {
          emit(const LessonPdfEmpty());
        } else {
          emit(LessonPdfSuccess(pdfBytes: bytes));
        }
      } else {
        if (isClosed) return;
        emit(
          const LessonPdfFailure(
            error: AppErrorModel(
              code: 'PDF_FETCH_ERROR',
              message: 'تعذّر تحميل ملف الدرس، حاول مرة أخرى.',
              type: AppErrorType.server,
              isRetryable: true,
            ),
          ),
        );
      }
    } catch (_) {
      if (isClosed) return;
      emit(
        const LessonPdfFailure(
          error: AppErrorModel(
            code: 'PDF_NETWORK_ERROR',
            message: 'حدث خطأ أثناء تحميل الملف، تأكد من اتصالك بالإنترنت.',
            type: AppErrorType.network,
            isRetryable: true,
          ),
        ),
      );
    } finally {
      client?.close();
    }
  }

  void retry() {
    loadPdf();
  }
}
