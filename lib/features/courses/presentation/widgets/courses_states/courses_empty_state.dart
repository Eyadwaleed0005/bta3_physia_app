import 'package:bta3_physia/app/routes/app_images_routes.dart';
import 'package:bta3_physia/features/courses/presentation/widgets/courses_states/courses_message_card.dart';
import 'package:flutter/material.dart';

class CoursesEmptyState extends StatelessWidget {
  const CoursesEmptyState({super.key, required this.onRefreshPressed});

  final VoidCallback onRefreshPressed;

  @override
  Widget build(BuildContext context) {
    return CoursesMessageCard(
      title: 'لا توجد كورسات متاحة',
      description: 'ستظهر هنا الكورسات المنشورة لصفّك بمجرد إضافتها.',
      onPressed: onRefreshPressed,
      buttonText: 'تحديث',
      image: AppImage().graduation,
    );
  }
}
