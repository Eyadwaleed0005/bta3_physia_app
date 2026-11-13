import 'package:bta3_physia/app/dependency_injection/service_locator.dart';
import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/core/transition/app_transition.dart';
import 'package:bta3_physia/features/lesson_quiz/data/models/lesson_quiz_model.dart';
import 'package:bta3_physia/features/lesson_quiz/data/models/lesson_quiz_result_model.dart';
import 'package:bta3_physia/features/lesson_quiz/presentation/cubit/lesson_quiz_cubit.dart';
import 'package:bta3_physia/features/lesson_quiz/presentation/cubit/lesson_quiz_results_cubit.dart';
import 'package:bta3_physia/features/lesson_quiz/presentation/screens/lesson_quiz_result_screen.dart';
import 'package:bta3_physia/features/lesson_quiz/presentation/screens/lessons_quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract final class LessonQuizRoutes {
  const LessonQuizRoutes._();

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.lessonQuizScreen:
        final Object? arguments = settings.arguments;
        final LessonQuizModel? quiz = arguments is LessonQuizModel
            ? arguments
            : null;
        return AppTransition.simpleTransition(
          settings: settings,
          screen: BlocProvider<LessonQuizCubit>(
            create: (context) =>
                getIt<LessonQuizCubit>()..startAttempt(quiz: quiz),
            child: LessonsQuizScreen(),
          ),
        );
      case RouteNames.lessonQuizResultScreen:
        final Object? arguments = settings.arguments;
        final LessonQuizResultModel? result = arguments is LessonQuizResultModel
            ? arguments
            : null;
        return AppTransition.simpleTransition(
          settings: settings,
          screen: BlocProvider<LessonQuizResultsCubit>(
            create: (context) {
              final cubit = getIt<LessonQuizResultsCubit>();

              cubit.load(result!);

              return cubit;
            },
            child: const LessonQuizResultScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
