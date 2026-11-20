import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/features/exams/presentation/cubit/exam_solve_state.dart';
import 'package:bta3_physia/features/exams/presentation/widgets/exam_solve_screen_content_widgets/solve_question_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SolveProgressBand extends StatelessWidget {
  final ExamSolveState state;
  final ValueChanged<int> onQuestionTap;

  const SolveProgressBand({
    super.key,
    required this.state,
    required this.onQuestionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            state.answeredCounterLabel,
            textAlign: TextAlign.end,
            style: AppTextStyle.font13TextMutedRegularTajawal(),
          ),
        ),
        horizontalSpace(14),
        SizedBox(
          height: 44.h,
          width: 150.w,
          child: Row(
            children: [
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => SolveQuestionChip(
                    valueKey: ValueKey<int>(index),
                    index: index,
                    isCurrent: index == state.currentIndex,
                    isAnswered: state.questions[index].isAnswered,
                    onTap: () => onQuestionTap(index),
                  ),
                  separatorBuilder: (context, index) => horizontalSpace(10),
                  itemCount: state.questions.length,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
