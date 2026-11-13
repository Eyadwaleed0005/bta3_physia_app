import 'package:bta3_physia/features/live/presentation/cubit/live_cubit.dart';
import 'package:bta3_physia/features/live/presentation/cubit/live_state.dart';
import 'package:bta3_physia/features/live/presentation/widgets/live_states/live_available_state.dart';
import 'package:bta3_physia/features/live/presentation/widgets/live_states/live_empty_state.dart';
import 'package:bta3_physia/features/live/presentation/widgets/live_states/live_failure_state.dart';
import 'package:bta3_physia/features/live/presentation/widgets/live_states/live_loading_state.dart';
import 'package:bta3_physia/features/live/presentation/widgets/live_states/live_offline_state.dart';
import 'package:bta3_physia/features/live/presentation/widgets/live_states/live_opening_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LiveBodyForMode extends StatelessWidget {
  final LiveState state;
  const LiveBodyForMode({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LiveCubit>();

    switch (state.viewMode) {
      case LiveViewMode.available:
        return LiveAvailableState(
          liveTitle: state.liveTitle,
          teacher: state.teacher,
          onJoinPressed: () => cubit.joinLive(),
        );

      case LiveViewMode.empty:
        return LiveEmptyState(onRefreshPressed: () => cubit.refresh());

      case LiveViewMode.loading:
        return const LiveLoadingState();

      case LiveViewMode.failure:
        return LiveFailureState(onRetryPressed: () => cubit.refresh());

      case LiveViewMode.offline:
        return LiveOfflineState(onRetryPressed: () => cubit.refresh());

      case LiveViewMode.opening:
        return LiveOpeningState(onReturnPressed: () => cubit.returnToStream());
    }
  }
}
