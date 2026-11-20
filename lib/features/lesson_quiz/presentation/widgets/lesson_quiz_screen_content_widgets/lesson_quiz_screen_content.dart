import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/widgets/custom_app_bar.dart';
import 'package:bta3_physia/features/lesson_quiz/presentation/cubit/lesson_quiz_cubit.dart';
import 'package:bta3_physia/features/lesson_quiz/presentation/cubit/lesson_quiz_state.dart';
import 'package:bta3_physia/features/lesson_quiz/presentation/widgets/lesson_quiz_screen_content_widgets/lesson_quiz_body_for_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LessonQuizScreenContent extends StatelessWidget {
  const LessonQuizScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LessonQuizCubit, LessonQuizState>(
      listenWhen: (previous, current) =>
          current.viewMode == LessonQuizViewMode.submitted &&
          previous.viewMode != LessonQuizViewMode.submitted,
      listener: (context, state) {
        final result = state.result;
        if (result == null) return;

        Navigator.of(context).pushReplacementNamed(
          RouteNames.lessonQuizResultScreen,
          arguments: result,
        );
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomAppBar(title: state.title, subTitle: state.examTitle),
              verticalSpace(16),
              Expanded(child: LessonQuizBodyForMode(state: state)),
            ],
          ),
        );
      },
    );
  }
}
