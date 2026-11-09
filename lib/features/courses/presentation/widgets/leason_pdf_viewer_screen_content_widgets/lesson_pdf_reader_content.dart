import 'package:bta3_physia/core/widgets/background/app_screen_backdrop.dart';
import 'package:bta3_physia/features/courses/presentation/cubit/lesson_pdf_cubit.dart';
import 'package:bta3_physia/features/courses/presentation/widgets/leason_pdf_viewer_screen_content_widgets/lesson_pdf_body.dart';
import 'package:bta3_physia/features/courses/presentation/widgets/leason_pdf_viewer_screen_content_widgets/lesson_pdf_reader_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonPdfReaderContent extends StatelessWidget {
  const LessonPdfReaderContent({
    super.key,
    this.url,
    this.title,
    this.subTitle,
  });

  final String? url;
  final String? title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.orientationOf(context) == Orientation.landscape;

    final cubit = context.read<LessonPdfCubit>();
    final displayTitle = title ?? cubit.title;
    final displayUrl = url ?? cubit.url;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: LessonPdfReaderHeader(
        lessonTitle: displayTitle,
        lessonSubTitle: subTitle ?? 'ملف الدرس',
        isLandscape: isLandscape,
      ),
      body: AppScreenBackdrop(child: LessonPdfBody(url: displayUrl)),
    );
  }
}
