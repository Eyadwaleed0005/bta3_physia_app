import 'package:bta3_physia/app/routes/app_images_routes.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/features/home/presentation/widgets/home_quick_actions_widgets/quick_action_card.dart';
import 'package:flutter/material.dart';

class HomeQuickActions extends StatelessWidget {
  const HomeQuickActions({
    super.key,
    this.onCoursesTap,
    this.onExamsTap,
    this.onResultsTap,
  });

  final VoidCallback? onCoursesTap;
  final VoidCallback? onExamsTap;
  final VoidCallback? onResultsTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: QuickActionCard(
            title: 'نتائجي',
            icon: AppImage().blueChart,
            onTap: onResultsTap,
          ),
        ),
        horizontalSpace(12),
        Expanded(
          child: QuickActionCard(
            title: 'الامتحانات',
            icon: AppImage().blueExam,
            onTap: onExamsTap,
          ),
        ),
        horizontalSpace(12),
        Expanded(
          child: QuickActionCard(
            title: 'كورساتي',
            icon: AppImage().blueBook,
            onTap: onCoursesTap,
          ),
        ),
      ],
    );
  }
}
