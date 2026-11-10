import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/core/widgets/custom_button.dart';
import 'package:bta3_physia/features/lesson_quiz/presentation/cubit/lesson_quiz_results_state.dart';
import 'package:bta3_physia/features/lesson_quiz/presentation/widgets/lesson_quiz_result_screen_content_widgets/lesson_quiz_result_card.dart';
import 'package:bta3_physia/features/lesson_quiz/presentation/widgets/lesson_quiz_result_screen_content_widgets/lesson_quiz_result_score_summary.dart';
import 'package:flutter/material.dart';

class LessonQuizResultDetails extends StatelessWidget {
  final LessonQuizResultsState state;
  final VoidCallback onRetryPressed;

  final VoidCallback onReturnPressed;

  const LessonQuizResultDetails({
    super.key,
    required this.state,
    required this.onRetryPressed,

    required this.onReturnPressed,
  });

  @override
  Widget build(BuildContext context) {
    final result = state.result;
    if (result == null) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'نتيجة التدريب',
          textAlign: TextAlign.center,
          style: AppTextStyle.font18TextLightBoldTajawal(),
        ),
        verticalSpace(24),
        LessonQuizResultScoreSummary(scoreLabel: state.scoreLabel),
        verticalSpace(24),
        Text(
          'مراجعة إجاباتك',
          textAlign: TextAlign.center,
          style: AppTextStyle.font16TextSecondaryBoldTajawal(),
        ),
        verticalSpace(12),
        for (int index = 0; index < result.answers.length; index++) ...[
          if (index != 0) verticalSpace(16),
          LessonQuizResultCard(answers: result, index: index),
        ],
        verticalSpace(24),
        CustomButton(
          text: 'إعاده التدريب',
          onPressed: onRetryPressed,
          background: ColorPalette.accent,
          foreground: ColorPalette.textBlack,
        ),
        verticalSpace(12),
        CustomButton(
          text: 'العودة إلى الدرس',
          onPressed: onReturnPressed,
          background: ColorPalette.panelGlass,
          foreground: ColorPalette.textLight,
        ),
      ],
    );
  }
}
