import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/widgets/custom_app_bar.dart';
import 'package:bta3_physia/features/lesson_quiz/presentation/cubit/lesson_quiz_results_cubit.dart';
import 'package:bta3_physia/features/lesson_quiz/presentation/cubit/lesson_quiz_results_state.dart';
import 'package:bta3_physia/features/lesson_quiz/presentation/widgets/lesson_quiz_result_screen_content_widgets/lesson_quiz_result_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LessonQuizResultScreenContent extends StatelessWidget {
  const LessonQuizResultScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonQuizResultsCubit, LessonQuizResultsState>(
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
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: LessonQuizResultDetails(
                      state: state,
                      onRetryPressed: () => Navigator.of(context)
                          .pushReplacementNamed(RouteNames.lessonQuizScreen),
                      onReturnPressed: () => Navigator.of(context).pop(),
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
