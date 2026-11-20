import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/features/results/presentation/cubit/results_state.dart';
import 'package:bta3_physia/features/results/presentation/widgets/exam_result_screen_content_widgets/exam_result_score_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExamResultDetails extends StatelessWidget {
  final ResultsState state;
  final VoidCallback onReturnPressed;

  const ExamResultDetails({
    super.key,
    required this.state,
    required this.onReturnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          state.examTitle,
          textAlign: TextAlign.end,
          style: AppTextStyle.font18TextLightBoldTajawal(),
        ),
        verticalSpace(24),
        ExamResultScoreSummary(scoreLabel: state.scoreLabel),
        verticalSpace(24),
        Text(
          'اكتملت محاولتك',
          textAlign: TextAlign.center,
          style: AppTextStyle.font16TextHighlightBoldTajawal(),
        ),
        verticalSpace(8),
        Text(
          'تم استلام إجاباتك وتصحيحها. لا توجد إعادة للمحاولة في هذا الامتحان.',
          textAlign: TextAlign.center,
          style: AppTextStyle.font14TextMutedRegularTajawal(),
        ),
        verticalSpace(24),
        InkWell(
          onTap: onReturnPressed,
          borderRadius: BorderRadius.circular(21.r),
          child: Container(
            height: 42.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ColorPalette.fieldFill,
              borderRadius: BorderRadius.circular(21.r),
              border: Border.all(color: ColorPalette.borderWarm),
            ),
            child: Text(
              'العودة إلى النتائج',
              style: AppTextStyle.font14TextLightBoldTajawal(),
            ),
          ),
        ),
      ],
    );
  }
}
