import 'package:bta3_physia/app/dependency_injection/service_locator.dart';
import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/features/main_navigation/presentation/cubit/bottom_navigation_cubit.dart';
import 'package:bta3_physia/core/constant/main_navigation_tabs.dart';
import 'package:bta3_physia/features/results/presentation/cubit/results_cubit.dart';
import 'package:bta3_physia/features/results/presentation/cubit/results_state.dart';
import 'package:bta3_physia/features/results/presentation/widgets/exam_result_states/exam_result_failure_state.dart';
import 'package:bta3_physia/features/results/presentation/widgets/exam_result_states/exam_result_loaded_state.dart';
import 'package:bta3_physia/features/results/presentation/widgets/exam_result_states/exam_result_loading_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamResultBodyForMode extends StatelessWidget {
  final ResultsState state;
  const ExamResultBodyForMode({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ResultsCubit>();

    switch (state.resultViewMode) {
      case ExamResultViewMode.loading:
        return const ExamResultLoadingState();

      case ExamResultViewMode.loaded:
        return ExamResultLoadedState(
          state: state,
          onReturnPressed: () => _returnToResults(context),
        );

      case ExamResultViewMode.failure:
        return ExamResultFailureState(
          onRetryPressed: () => cubit.retryResult(),
        );
    }
  }

  void _returnToResults(BuildContext context) {
    getIt<BottomNavigationCubit>().changeIndex(MainNavigationTabs.results);

    Navigator.of(context).popUntil(
      (route) =>
          route.settings.name == RouteNames.mainNavigationScreen ||
          route.isFirst,
    );
  }
}
