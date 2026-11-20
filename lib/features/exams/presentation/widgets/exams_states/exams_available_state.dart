import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/features/exams/data/models/exams_model.dart';
import 'package:bta3_physia/features/exams/presentation/widgets/exams_screen_content_widgets/exam_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExamsAvailableState extends StatelessWidget {
  final List<ExamsModel> exams;
  const ExamsAvailableState({super.key, required this.exams});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(bottom: 120.h),
      itemCount: exams.length,
      separatorBuilder: (_, __) => verticalSpace(16),
      itemBuilder: (context, i) => ExamCard(
        exam: exams[i],
        onStart: () {
          Navigator.of(context)
              .pushNamed(RouteNames.examSolveScreen, arguments: exams[i]);
        },
      ),
    );
  }
}
