import 'package:bta3_physia/core/helper/arabic_numbers_helper.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/features/lesson_quiz/models/lesson_quiz_result_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LessonQuizResultCard extends StatelessWidget {
  final LessonQuizResultModel answers;
  final int index;
  const LessonQuizResultCard({
    super.key,
    required this.answers,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final question = answers.answers[index];
    final isCorrect = question.isCorrect;
    final isAnswered = question.isAnswered;
    final selectedText =
        isAnswered &&
            question.selectedAnswerIndex! >= 0 &&
            question.selectedAnswerIndex! < question.answersText.length
        ? question.answersText[question.selectedAnswerIndex!]
        : 'لم يتم الإجابة';

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: ColorPalette.fieldFill,
        border: Border.all(
          color: isCorrect ? ColorPalette.accent : ColorPalette.orange300,
        ),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'السؤال ${toArabicNumbers(index + 1)}',
            style: AppTextStyle.font12TextSecondaryBoldTajawal(),
          ),
          verticalSpace(12),
          Text(
            question.questionText,
            textAlign: TextAlign.end,
            style: AppTextStyle.font14TextLightBoldTajawal(),
          ),
          verticalSpace(12),
          Text('إجابتك', style: AppTextStyle.font12TextMutedRegularTajawal()),
          verticalSpace(6),
          Text(
            selectedText,
            textAlign: TextAlign.end,
            style: AppTextStyle.font12TextSecondaryBoldTajawal(),
          ),
          verticalSpace(12),
          Text(
            isCorrect ? 'إجابة صحيحة' : 'إجابة غير صحيحة',
            style: AppTextStyle.font12TextSecondaryBoldTajawal().copyWith(
              color: isCorrect ? ColorPalette.accent : ColorPalette.orange300,
            ),
          ),
        ],
      ),
    );
  }
}
