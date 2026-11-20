import 'package:bta3_physia/features/courses/presentation/cubit/lesson_pdf__state.dart';
import 'package:bta3_physia/features/courses/presentation/cubit/lesson_pdf_cubit.dart';
import 'package:bta3_physia/features/courses/presentation/widgets/leason_pdf_viewer_screen_content_widgets/lesson_pdf_reader_screen_states/lesson_pdf_empty_view.dart';
import 'package:bta3_physia/features/courses/presentation/widgets/leason_pdf_viewer_screen_content_widgets/lesson_pdf_reader_screen_states/lesson_pdf_error_view.dart';
import 'package:bta3_physia/features/courses/presentation/widgets/leason_pdf_viewer_screen_content_widgets/lesson_pdf_reader_screen_states/lesson_pdf_loading_view.dart';
import 'package:bta3_physia/features/courses/presentation/widgets/leason_pdf_viewer_screen_content_widgets/lesson_pdf_reader_screen_states/lesson_pdf_success_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonPdfBody extends StatelessWidget {
  const LessonPdfBody({super.key, this.url});

  final String? url;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonPdfCubit, LessonPdfState>(
      builder: (context, state) {
        if (state is LessonPdfFailure) {
          return LessonPdfErrorView(
            errorMessage: state.error.message,
            onRetry: () {
              context.read<LessonPdfCubit>().retry();
            },
          );
        }

        if (state is LessonPdfEmpty) {
          return const LessonPdfEmptyView();
        }

        if (state is LessonPdfSuccess) {
          return LessonPdfSuccessView(pdfBytes: state.pdfBytes);
        }

        return const LessonPdfLoadingView();
      },
    );
  }
}
