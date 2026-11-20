import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/features/exams/presentation/cubit/exam_solve_state.dart';
import 'package:flutter/material.dart';

class SolveQuestionCard extends StatelessWidget {
  final ExamSolveState state;
  const SolveQuestionCard({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final question = state.currentQuestion;
    if (question == null) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Text(
              state.degreesLabel,
              style: AppTextStyle.font13TextSecondaryBoldTajawal(),
            ),
            const Spacer(),
            Text(
              state.questionCounterLabel,
              style: AppTextStyle.font13TextMutedRegularTajawal(),
            ),
          ],
        ),
        verticalSpace(14),
        Text(
          question.questionText,
          textAlign: TextAlign.end,
          style: AppTextStyle.font18TextLightBoldTajawal(),
        ),
      ],
    );
  }
}
