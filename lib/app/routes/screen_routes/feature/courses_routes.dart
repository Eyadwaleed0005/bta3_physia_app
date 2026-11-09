import 'package:bta3_physia/app/dependency_injection/service_locator.dart';
import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/core/transition/app_transition.dart';
import 'package:bta3_physia/features/courses/data/models/course_lesson_model.dart';
import 'package:bta3_physia/features/courses/data/models/course_model.dart';
import 'package:bta3_physia/features/courses/data/models/lesson_pdf_viewer_arguments.dart';
import 'package:bta3_physia/features/courses/data/models/lesson_detail_arguments.dart';
import 'package:bta3_physia/features/courses/presentation/cubit/course_cubit.dart';
import 'package:bta3_physia/features/courses/presentation/cubit/lesson_detail_cubit.dart';
import 'package:bta3_physia/features/courses/presentation/cubit/lesson_pdf_cubit.dart';
import 'package:bta3_physia/features/courses/presentation/screens/course_lessons_screen.dart';
import 'package:bta3_physia/features/courses/presentation/screens/courses_screen.dart';
import 'package:bta3_physia/features/courses/presentation/screens/leason_pdf_viewer_screen.dart';
import 'package:bta3_physia/features/courses/presentation/screens/lesson_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract final class CoursesRoutes {
  const CoursesRoutes._();

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.coursesScreen:
        return AppTransition.simpleTransition(
          settings: settings,
          screen: BlocProvider<CourseCubit>(
            create: (_) => getIt<CourseCubit>(),
            child: const CoursesScreen(),
          ),
        );

      case RouteNames.courseLessonsScreen:
        final Object? arguments = settings.arguments;
        final CourseModel? course = arguments is CourseModel ? arguments : null;

        return AppTransition.simpleTransition(
          settings: settings,
          screen: BlocProvider<CourseCubit>(
            create: (_) => getIt<CourseCubit>(),
            child: CourseLessonsScreen(course: course!),
          ),
        );

      case RouteNames.lessonDetailScreen:
        final Object? arguments = settings.arguments;
        final LessonDetailArguments? lessonArguments =
            arguments is LessonDetailArguments ? arguments : null;

        return AppTransition.simpleTransition(
          settings: settings,
          screen: BlocProvider<LessonDetailCubit>(
            create: (_) {
              final cubit = getIt<LessonDetailCubit>();
              final LessonDetailArguments? data = lessonArguments;
              if (data != null) {
                cubit.loadLesson(
                  lessons: data.lessons,
                  lessonIndex: data.lessonIndex,
                  courseTitle: data.courseTitle,
                );
              }
              return cubit;
            },
            child: const LessonDetailScreen(),
          ),
        );

      case RouteNames.lessonPdfViewerScreen:
        final Object? arguments = settings.arguments;
        final LessonPdfViewerArguments viewerArguments =
            arguments is LessonPdfViewerArguments
            ? arguments
            : const LessonPdfViewerArguments(
                title: 'ملاحظات الدرس',
                url: CourseLessonModel.defaultPdfUrl,
              );

        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider<LessonPdfCubit>(
            create: (_) => getIt<LessonPdfCubit>(param1: viewerArguments),
            child: LeasonPdfViewerScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
