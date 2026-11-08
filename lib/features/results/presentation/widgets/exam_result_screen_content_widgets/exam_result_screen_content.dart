import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/widgets/custom_app_bar.dart';
import 'package:bta3_physia/features/results/presentation/cubit/results_cubit.dart';
import 'package:bta3_physia/features/results/presentation/cubit/results_state.dart';
import 'package:bta3_physia/features/results/presentation/widgets/exam_result_screen_content_widgets/exam_result_body_for_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExamResultScreenContent extends StatelessWidget {
  const ExamResultScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResultsCubit, ResultsState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomAppBar(
                title: state.resultTitle,
                subTitle: state.resultSubTitle,
              ),
              verticalSpace(16),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: ExamResultBodyForMode(state: state),
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
