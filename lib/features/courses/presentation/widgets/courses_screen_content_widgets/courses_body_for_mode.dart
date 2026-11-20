import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/features/courses/presentation/cubit/course_cubit.dart';
import 'package:bta3_physia/features/courses/presentation/cubit/course_state.dart';
import 'package:bta3_physia/features/courses/presentation/widgets/courses_screen_content_widgets/courses_filter_tabs.dart';
import 'package:bta3_physia/features/courses/presentation/widgets/courses_states/courses_available_state.dart';
import 'package:bta3_physia/features/courses/presentation/widgets/courses_screen_content_widgets/courses_search_field.dart';
import 'package:bta3_physia/features/courses/presentation/widgets/courses_states/courses_empty_state.dart';
import 'package:bta3_physia/features/courses/presentation/widgets/courses_states/courses_failure_states.dart';
import 'package:bta3_physia/features/courses/presentation/widgets/courses_states/courses_loading_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoursesBodyForMode extends StatelessWidget {
  const CoursesBodyForMode({super.key, required this.state});

  final CourseState state;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CourseCubit>();

    switch (state.viewMode) {
      case CourseViewMode.loading:
        return Padding(
          padding: EdgeInsets.only(top: 24.h),
          child: const CoursesLoadingState(),
        );

      case CourseViewMode.empty:
        return Padding(
          padding: EdgeInsets.only(top: 24.h),
          child: CoursesEmptyState(onRefreshPressed: cubit.refresh),
        );

      case CourseViewMode.failure:
        return Padding(
          padding: EdgeInsets.only(top: 24.h),
          child: CoursesFailureState(onRetryPressed: cubit.refresh),
        );

      case CourseViewMode.available:
        return Padding(
          padding: EdgeInsets.only(top: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CoursesFilterTabs(
                selected: state.filter,
                onChanged: cubit.setFilter,
              ),
              verticalSpace(18),
              CoursesSearchField(
                initialQuery: state.query,
                onChanged: cubit.updateQuery,
              ),
              verticalSpace(18),
              CoursesAvailableState(courses: state.visibleCourses),
            ],
          ),
        );
    }
  }
}
