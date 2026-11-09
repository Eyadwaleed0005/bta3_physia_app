import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/core/helper/arabic_numbers_helper.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/core/widgets/custom_app_bar.dart';
import 'package:bta3_physia/features/courses/data/models/course_lesson_model.dart';
import 'package:bta3_physia/features/courses/data/models/lesson_detail_arguments.dart';
import 'package:bta3_physia/features/courses/presentation/cubit/lesson_detail_cubit.dart';
import 'package:bta3_physia/features/courses/presentation/cubit/lesson_detail_state.dart';
import 'package:bta3_physia/features/courses/data/models/lesson_pdf_viewer_arguments.dart';
import 'package:bta3_physia/features/courses/presentation/widgets/lesson_detail_screen_content_widgets/lesson_navigation_bar.dart';
import 'package:bta3_physia/features/courses/presentation/widgets/lesson_detail_screen_content_widgets/lesson_section.dart';
import 'package:bta3_physia/features/courses/presentation/widgets/lesson_detail_screen_content_widgets/lesson_video_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LessonDetailScreenContent extends StatelessWidget {
  const LessonDetailScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonDetailCubit, LessonDetailState>(
      builder: (context, state) {
        final CourseLessonModel? lesson = state.lesson;
        if (lesson == null) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const CustomAppBar(title: 'مشاهدة الدرس', subTitle: ''),
                Expanded(
                  child: Center(
                    child: Text(
                      'تعذّر تحميل الدرس',
                      style: AppTextStyle.font16TextSecondaryBoldTajawal(),
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomAppBar(title: 'مشاهدة الدرس', subTitle: state.courseTitle),
              Expanded(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.h, bottom: 120.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        LessonVideoCard(videoUrl: lesson.videoUrl),
                        verticalSpace(20),
                        Text(
                          'الدرس ${toArabicNumbers(state.lessonIndex + 1)} '
                          'من ${toArabicNumbers(state.lessonsCount)}',
                          textAlign: TextAlign.end,
                          style: AppTextStyle.font12TextSecondaryBoldTajawal(),
                        ),
                        verticalSpace(8),
                        Text(
                          lesson.title,
                          textAlign: TextAlign.end,
                          style: AppTextStyle.font20TextLightBoldTajawal(),
                        ),
                        verticalSpace(6),
                        Text(
                          lesson.description,
                          textAlign: TextAlign.end,
                          style: AppTextStyle.font13TextMutedRegularTajawal(),
                        ),
                        if (lesson.hasPdf) ...[
                          verticalSpace(24),
                          LessonSection(
                            title: 'ملف الدرس',
                            description: 'يُحفظ داخل التطبيق عند أول فتح',
                            buttonText: 'فتح الملف',
                            isPrimary: true,
                            onPressed: () => _openPdf(context, lesson),
                          ),
                        ],
                        if (lesson.hasTraining) ...[
                          verticalSpace(24),
                          LessonSection(
                            title: 'تدريب الدرس',
                            description: 'تدرب على الدرس وراجع إجاباتك',
                            buttonText: 'ابدأ التدريب',
                            isPrimary: false,
                            onPressed: () => _startTraining(context, lesson),
                          ),
                        ],
                        verticalSpace(28),
                        LessonNavigationBar(
                          hasPrevious: state.hasPrevious,
                          hasNext: state.hasNext,
                          onPrevious: () => _openLessonAt(
                            context,
                            state,
                            state.lessonIndex - 1,
                          ),
                          onNext: () => _openLessonAt(
                            context,
                            state,
                            state.lessonIndex + 1,
                          ),
                          onBackToLessons: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _openLessonAt(
    BuildContext context,
    LessonDetailState state,
    int lessonIndex,
  ) {
    Navigator.of(context).pushReplacementNamed(
      RouteNames.lessonDetailScreen,
      arguments: LessonDetailArguments(
        lessons: state.lessons,
        lessonIndex: lessonIndex,
        courseTitle: state.courseTitle,
      ),
    );
  }

  void _openPdf(BuildContext context, CourseLessonModel lesson) {
    final String url = lesson.pdfUrl ?? CourseLessonModel.defaultPdfUrl;

    Navigator.of(context).pushNamed(
      RouteNames.lessonPdfViewerScreen,
      arguments: LessonPdfViewerArguments(title: lesson.title, url: url),
    );
  }

  void _startTraining(BuildContext context, CourseLessonModel lesson) {
    Navigator.of(context).pushNamed(
      RouteNames.lessonQuizScreen,
      /* arguments: ExamsModel(
        id: 'training-${lesson.id}',
        title: 'امتحان تدريبي · ${lesson.title}',
        totlaQuestions: lesson.trainingQuestions,
        totalDegrees: lesson.trainingQuestions * 2,
        time: '${lesson.trainingMinutes}',
      ), */
    );
  }
}
