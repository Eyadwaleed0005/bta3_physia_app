import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/features/lesson_quiz/presentation/cubit/lesson_quiz_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LessonQuizQuestionCard extends StatelessWidget {
  final LessonQuizState state;
  const LessonQuizQuestionCard({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final question = state.currentQuestion;
    if (question == null) return const SizedBox.shrink();

    return Column(
      children: [
        Row(
          children: [
            const Spacer(),
            Text(
              state.questionCounterLabel,
              style: AppTextStyle.font13TextMutedRegularTajawal(),
            ),
          ],
        ),
        verticalSpace(14),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: ColorPalette.panelGlass,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            question.questionText,
            textAlign: TextAlign.end,
            style: AppTextStyle.font18TextLightBoldTajawal(),
          ),
        ),
      ],
    );
  }
}
