import 'package:bta3_physia/features/courses/presentation/widgets/courses_states/courses_message_card.dart';
import 'package:flutter/material.dart';

class CoursesLoadingState extends StatelessWidget {
  const CoursesLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return const CoursesMessageCard(
      title: 'جارٍ التحميل',
      description: 'نحمّل الكورسات المتاحة لصفّك.',
      isLoading: true,
    );
  }
}
