import 'package:bta3_physia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bta3_physia/features/home/presentation/cubit/home_state.dart';
import 'package:bta3_physia/features/home/presentation/widgets/home_screen_content_widgets/build_full_content.dart';
import 'package:bta3_physia/features/home/presentation/widgets/home_states/home_empty_state.dart';
import 'package:bta3_physia/features/home/presentation/widgets/home_states/home_failure_state.dart';
import 'package:bta3_physia/features/home/presentation/widgets/home_states/home_loading_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildHomeBodyForMode extends StatelessWidget {
  final HomeState state;
  const BuildHomeBodyForMode({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    switch (state.viewMode) {
      case HomeViewMode.loading:
        return Padding(
          padding: EdgeInsets.only(top: 40.h),
          child: const HomeLoadingState(),
        );

      case HomeViewMode.emptyGrade:
        return Padding(
          padding: EdgeInsets.only(top: 40.h),
          child: HomeEmptyState(
            onRefreshPressed: () {
              context.read<HomeCubit>().refresh();
            },
          ),
        );

      case HomeViewMode.failure:
        return Padding(
          padding: EdgeInsets.only(top: 40.h),
          child: HomeFailureState(
            onRetryPressed: () {
              context.read<HomeCubit>().refresh();
            },
          ),
        );

      case HomeViewMode.contentNoLive:
        return BuildFullContent(isLive: false);

      case HomeViewMode.contentWithLive:
        return BuildFullContent(isLive: true);
    }
  }
}
