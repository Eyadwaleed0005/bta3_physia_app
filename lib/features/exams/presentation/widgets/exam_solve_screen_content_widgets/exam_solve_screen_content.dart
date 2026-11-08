import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/widgets/custom_app_bar.dart';
import 'package:bta3_physia/features/exams/presentation/cubit/exam_solve_cubit.dart';
import 'package:bta3_physia/features/exams/presentation/cubit/exam_solve_state.dart';
import 'package:bta3_physia/features/exams/presentation/widgets/exam_solve_screen_content_widgets/exam_solve_body_for_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExamSolveScreenContent extends StatelessWidget {
  const ExamSolveScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExamSolveCubit, ExamSolveState>(
      listenWhen: (previous, current) =>
          current.viewMode == ExamSolveViewMode.finished &&
          previous.viewMode != ExamSolveViewMode.finished,
      listener: (context, state) {
        final result = state.result;
        if (result == null) return;

        Navigator.of(
          context,
        ).pushReplacementNamed(RouteNames.examResultScreen, arguments: result);
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomAppBar(title: state.title, subTitle: state.subTitle),
              verticalSpace(16),
              Expanded(child: ExamSolveBodyForMode(state: state)),
            ],
          ),
        );
      },
    );
  }
}
