import 'package:bta3_physia/core/widgets/custom_app_bar.dart';
import 'package:bta3_physia/features/exams/presentation/cubit/exams_cubit.dart';
import 'package:bta3_physia/features/exams/presentation/cubit/exams_state.dart';
import 'package:bta3_physia/features/exams/presentation/widgets/exams_screen_content_widgets/exams_body_for_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExamsScreenContent extends StatelessWidget {
  const ExamsScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamsCubit, ExamsState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomAppBar(title: state.title, subTitle: state.subTitle),

              Expanded(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: ExamsBodyForMode(state: state),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
