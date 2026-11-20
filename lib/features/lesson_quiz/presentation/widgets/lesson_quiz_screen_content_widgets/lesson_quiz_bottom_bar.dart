import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LessonQuizBottomBar extends StatelessWidget {
  final bool isFirstQuestion;
  final bool isLastQuestion;
  final bool isCurrentQuestionAnswered;
  final VoidCallback onBackToLessonPressed;
  final VoidCallback onPreviousPressed;
  final VoidCallback onNextPressed;
  final VoidCallback onSubmitPressed;

  const LessonQuizBottomBar({
    super.key,
    required this.isFirstQuestion,
    required this.isLastQuestion,
    required this.isCurrentQuestionAnswered,
    required this.onBackToLessonPressed,
    required this.onPreviousPressed,
    required this.onNextPressed,
    required this.onSubmitPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            onPressed: isFirstQuestion
                ? onBackToLessonPressed
                : onPreviousPressed,
            height: 44.h,
            background: ColorPalette.panelGlass,
            foreground: ColorPalette.textLight,
            borderRadius: 22.r,
            text: isFirstQuestion ? 'العودة إلى الدرس' : 'السؤال السابق',
            textStyle: AppTextStyle.font16TextPrimaryBoldTajawal(),
          ),
        ),
        horizontalSpace(9),
        Expanded(
          child: CustomButton(
            onPressed: isLastQuestion
                ? onSubmitPressed
                : isCurrentQuestionAnswered
                ? onNextPressed
                : null,
            height: 44.h,
            background: ColorPalette.accent,
            foreground: ColorPalette.textPrimary,
            borderRadius: 22.r,
            text: isLastQuestion ? 'تسليم الامتحان' : 'التالي',
            textStyle: AppTextStyle.font16TextPrimaryBoldTajawal(),
          ),
        ),
      ],
    );
  }
}
