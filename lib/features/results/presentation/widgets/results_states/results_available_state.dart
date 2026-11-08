import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/features/results/data/models/exam_result_model.dart';
import 'package:bta3_physia/features/results/presentation/widgets/results_screen_content_widgets/result_card.dart';
import 'package:flutter/material.dart';

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
        for (int index = 0; index < results.length; index++) ...[
          if (index != 0) verticalSpace(12),
          ResultCard(
            result: results[index],
            onTap: () => onResultTap(results[index]),
          ),
        ],
      ],
    );
  }
}
