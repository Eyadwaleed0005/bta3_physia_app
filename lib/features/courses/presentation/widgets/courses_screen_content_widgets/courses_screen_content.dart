import 'package:bta3_physia/core/widgets/custom_app_bar.dart';
import 'package:bta3_physia/features/courses/presentation/cubit/course_cubit.dart';
import 'package:bta3_physia/features/courses/presentation/cubit/course_state.dart';
import 'package:bta3_physia/features/courses/presentation/widgets/courses_screen_content_widgets/courses_body_for_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoursesScreenContent extends StatelessWidget {
  const CoursesScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseCubit, CourseState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomAppBar(
                title: state.title,
                subTitle: state.subTitle,
                showContentOnly: false,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: CoursesBodyForMode(state: state),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
