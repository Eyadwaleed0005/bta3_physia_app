import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/features/results/data/models/exam_result_model.dart';
import 'package:bta3_physia/features/results/presentation/widgets/results_screen_content_widgets/result_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultsAvailableState extends StatelessWidget {
  final List<ExamResultModel> results;
  final ValueChanged<ExamResultModel> onResultTap;

  const ResultsAvailableState({
    super.key,
    required this.results,
    required this.onResultTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(bottom: 120.h),
          itemCount: results.length,
          separatorBuilder: (_, __) => verticalSpace(16),
          itemBuilder: (context, i) => ResultCard(
            result: results[i],
            onTap: () {
              onResultTap(results[i]);
            },
          ),
        ),
      ],
    );
  }
}
