import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/features/home/presentation/widgets/home_screen_content_widgets/home_course_section.dart';
import 'package:bta3_physia/features/home/presentation/widgets/home_screen_content_widgets/home_live_card.dart';
import 'package:bta3_physia/features/home/presentation/widgets/home_quick_actions_widgets/home_quick_actions.dart';
import 'package:bta3_physia/features/main_navigation/presentation/cubit/bottom_navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildFullContent extends StatelessWidget {
  final bool isLive;
  const BuildFullContent({super.key, required this.isLive});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HomeLiveCard(
          isLive: isLive,
          onJoinPressed: () {
            _tryChangeNavTab(context, 2);
          },
          onOpenExternalPressed: () {
            _tryChangeNavTab(context, 2);
          },
        ),

        verticalSpace(16),

        HomeQuickActions(
          onCoursesTap: () {
            _tryChangeNavTab(context, 1);
          },
          onExamsTap: () {
            Navigator.of(context).pushNamed(RouteNames.examsScreen);
          },
          onResultsTap: () {
            _tryChangeNavTab(context, 3);
          },
        ),

        verticalSpace(20),

        HomeCourseSection(
          onViewAllTap: () {
            _tryChangeNavTab(context, 1);
          },
          onCourseTap: () {
            _tryChangeNavTab(context, 1);
          },
          onStartLearningTap: () {
            _tryChangeNavTab(context, 1);
          },
        ),
      ],
    );
  }
}

void _tryChangeNavTab(BuildContext context, int tabIndex) {
  try {
    context.read<BottomNavigationCubit>().changeIndex(tabIndex);
  } catch (_) {}
}
