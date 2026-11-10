import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/widgets/custom_app_bar.dart';
import 'package:bta3_physia/features/lesson_quiz/presentation/cubit/lesson_quiz_cubit.dart';
import 'package:bta3_physia/features/lesson_quiz/presentation/cubit/lesson_quiz_state.dart';
import 'package:bta3_physia/features/lesson_quiz/presentation/widgets/lesson_quiz_screen_content_widgets/lesson_quiz_body_for_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LessonsQuizContent extends StatelessWidget {
  const LessonsQuizContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonQuizCubit, LessonQuizState>(
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
