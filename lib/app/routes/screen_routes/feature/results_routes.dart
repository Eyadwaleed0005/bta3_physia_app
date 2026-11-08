import 'package:bta3_physia/app/dependency_injection/service_locator.dart';
import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/features/results/data/models/exam_result_model.dart';
import 'package:bta3_physia/features/results/presentation/cubit/results_cubit.dart';
import 'package:bta3_physia/features/results/presentation/screens/exam_result_screen.dart';
import 'package:bta3_physia/features/results/presentation/screens/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract final class ResultsRoutes {
  const ResultsRoutes._();

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.resultScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider<ResultsCubit>(
            create: (_) => getIt<ResultsCubit>(),
            child: const ResultsScreen(),
          ),
        );

      case RouteNames.examResultScreen:
        final Object? arguments = settings.arguments;
        final ExamResultModel? result = arguments is ExamResultModel
            ? arguments
            : null;

        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider<ResultsCubit>(
            create: (context) {
              final cubit = getIt<ResultsCubit>();
              if (result == null) {
                cubit.markFailure();
              } else {
                cubit.load(result);
              }
              return cubit;
            },
            child: const ExamResultScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
