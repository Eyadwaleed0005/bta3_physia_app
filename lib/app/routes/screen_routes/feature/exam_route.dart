import 'package:bta3_physia/app/dependency_injection/service_locator.dart';
import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/features/exams/data/models/exams_model.dart';
import 'package:bta3_physia/features/exams/presentation/cubit/exam_solve_cubit.dart';
import 'package:bta3_physia/features/exams/presentation/cubit/exams_cubit.dart';
import 'package:bta3_physia/features/exams/presentation/screens/exam_solve_screen.dart';
import 'package:bta3_physia/features/exams/presentation/screens/exams_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract final class ExamRoutes {
  const ExamRoutes._();

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.examsScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider<ExamsCubit>(
            create: (context) => getIt<ExamsCubit>(),
            child: ExamsScreen(),
          ),
        );

      case RouteNames.examSolveScreen:
        final Object? arguments = settings.arguments;
        final ExamsModel? exam = arguments is ExamsModel ? arguments : null;

        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider<ExamSolveCubit>(
            create: (context) =>
                getIt<ExamSolveCubit>()..startAttempt(exam: exam),
            child: const ExamSolveScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
