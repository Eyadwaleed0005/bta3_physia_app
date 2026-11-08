import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/features/exams/presentation/cubit/exams_cubit.dart';
import 'package:bta3_physia/features/exams/presentation/cubit/exams_state.dart';
import 'package:bta3_physia/features/exams/presentation/widgets/exams_states/exams_available_state.dart';
import 'package:bta3_physia/features/exams/presentation/widgets/exams_states/exams_empty_state.dart';
import 'package:bta3_physia/features/exams/presentation/widgets/exams_states/exams_failure_state.dart';
import 'package:bta3_physia/features/exams/presentation/widgets/exams_states/exams_loading_state.dart';
import 'package:bta3_physia/features/exams/presentation/widgets/exams_states/exams_pending_connection_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExamsBodyForMode extends StatelessWidget {
  final ExamsState state;
  const ExamsBodyForMode({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ExamsCubit>();

    switch (state.viewMode) {
      case ExamsViewMode.loading:
        return Padding(
          padding: EdgeInsets.only(top: 24.h),
          child: const ExamsLoadingState(),
        );

      case ExamsViewMode.empty:
        return Padding(
          padding: EdgeInsets.only(top: 24.h),
          child: ExamsEmptyState(onRefreshPressed: () => cubit.refresh()),
        );

      case ExamsViewMode.available:
        return Padding(
          padding: EdgeInsets.only(top: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'متاحة لصفّك، دون اشتراك في كورس.',
                style: AppTextStyle.font13TextMutedRegularTajawal(),
              ),
              verticalSpace(12),
              ExamsAvailableState(exams: state.items),
            ],
          ),
        );

      case ExamsViewMode.failure:
        return Padding(
          padding: EdgeInsets.only(top: 24.h),
          child: ExamsFailureState(onRetryPressed: () => cubit.refresh()),
        );

      /* case ExamsViewMode.closed:
        return Padding(
          padding: EdgeInsets.only(top: 24.h),
          child: ExamsClosedState(
            onReturnPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                RouteNames.mainNavigationScreen,
                (route) => false,
              );
            },
          ),
        );

      case ExamsViewMode.confirm:
        return Padding(
          padding: EdgeInsets.only(top: 24.h),
          child: ExamsConfirmSubmissionState(
            onConfirmPressed: () => cubit.setViewMode(ExamsViewMode.grading),
            onReturnPressed: () =>
                Navigator.of(context).pushNamed(RouteNames.examSolveScreen),
          ),
        );

      case ExamsViewMode.deleted:
        return Padding(
          padding: EdgeInsets.only(top: 24.h),
          child: ExamsDeletedState(
            onReturnPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                RouteNames.mainNavigationScreen,
                (route) => false,
              );
            },
          ),
        );
      case ExamsViewMode.grading:
        return Padding(
          padding: EdgeInsets.only(top: 24.h),
          child: const ExamsGradingState(),
        ); */
      case ExamsViewMode.pendingConnection:
        return Padding(
          padding: EdgeInsets.only(top: 24.h),
          child: ExamsPendingConnectionState(
            onRetryPressed: () => cubit.refresh(),
            onReturnPressed: () => Navigator.of(context).pop(),
          ),
        );
      /*  case ExamsViewMode.resume:
        return Padding(
          padding: EdgeInsets.only(top: 24.h),
          child: ExamsResumeState(
            onResumePressed: () =>
                Navigator.of(context).pushNamed(RouteNames.examSolveScreen),
            onReturnPressed: () => Navigator.of(context).pop(),
          ),
        );
      case ExamsViewMode.starting:
        return Padding(
          padding: EdgeInsets.only(top: 24.h),
          child: const ExamsStartingState(),
        ); */
    }
  }
}
