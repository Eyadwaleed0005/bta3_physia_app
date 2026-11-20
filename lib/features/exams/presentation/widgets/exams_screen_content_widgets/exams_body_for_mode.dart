import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/features/exams/presentation/cubit/exams_cubit.dart';
import 'package:bta3_physia/features/exams/presentation/cubit/exams_state.dart';
import 'package:bta3_physia/features/exams/presentation/widgets/exams_states/exams_available_state.dart';
import 'package:bta3_physia/features/exams/presentation/widgets/exams_states/exams_empty_state.dart';
import 'package:bta3_physia/features/exams/presentation/widgets/exams_states/exams_failure_state.dart';
import 'package:bta3_physia/features/exams/presentation/widgets/exams_states/exams_loading_state.dart';
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
    }
  }
}
