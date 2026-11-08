import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/widgets/custom_app_bar.dart';
import 'package:bta3_physia/features/results/presentation/cubit/results_cubit.dart';
import 'package:bta3_physia/features/results/presentation/cubit/results_state.dart';
import 'package:bta3_physia/features/results/presentation/widgets/results_screen_content_widgets/results_body_for_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultsScreenContent extends StatelessWidget {
  const ResultsScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResultsCubit, ResultsState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomAppBar(title: state.title, subTitle: state.subTitle),
              verticalSpace(16),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async => context.read<ResultsCubit>().refresh(),
                  color: ColorPalette.textPrimary,
                  backgroundColor: ColorPalette.accent,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: ResultsBodyForMode(state: state),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
