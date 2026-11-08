import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/features/results/presentation/cubit/results_cubit.dart';
import 'package:bta3_physia/features/results/presentation/cubit/results_state.dart';
import 'package:bta3_physia/features/results/presentation/widgets/results_states/results_available_state.dart';
import 'package:bta3_physia/features/results/presentation/widgets/results_states/results_empty_state.dart';
import 'package:bta3_physia/features/results/presentation/widgets/results_states/results_failure_state.dart';
import 'package:bta3_physia/features/results/presentation/widgets/results_states/results_loading_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultsBodyForMode extends StatelessWidget {
  final ResultsState state;
  const ResultsBodyForMode({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ResultsCubit>();

    switch (state.viewMode) {
      case ResultsViewMode.loading:
        return const ResultsLoadingState();

      case ResultsViewMode.empty:
        return _buildWithCaption(
          child: ResultsEmptyState(onRefreshPressed: () => cubit.refresh()),
        );

      case ResultsViewMode.available:
        return _buildWithCaption(
          child: ResultsAvailableState(
            results: state.items,
            onResultTap: (result) =>
                Navigator.of(context)
                    .pushNamed(RouteNames.examResultScreen, arguments: result),
          ),
        );

      case ResultsViewMode.failure:
        return _buildWithCaption(
          child: ResultsFailureState(onRetryPressed: () => cubit.retry()),
        );
    }
  }

  Widget _buildWithCaption({required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'نتائج الامتحانات التي أكملتها',
          textAlign: TextAlign.end,
          style: AppTextStyle.font13TextMutedRegularTajawal(),
        ),
        verticalSpace(12),
        child,
      ],
    );
  }
}
