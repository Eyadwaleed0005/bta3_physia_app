import 'package:bta3_physia/app/dependency_injection/service_locator.dart';
import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/core/transition/app_transition.dart';
import 'package:bta3_physia/features/exams/presentation/cubit/exams_cubit.dart';
import 'package:bta3_physia/features/lesson_quiz/presentation/screens/lessons_quiz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract final class LessonQuizRoutes {
  const LessonQuizRoutes._();

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.lessonQuizScreen:
        return AppTransition.simpleTransition(
          settings: settings,
          screen: BlocProvider<ExamsCubit>(
            create: (context) => getIt<ExamsCubit>(),
            child: LessonsQuiz(),
          ),
        );

      default:
        return null;
    }
  }
}
