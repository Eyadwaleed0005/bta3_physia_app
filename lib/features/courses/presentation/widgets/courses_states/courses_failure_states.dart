import 'package:bta3_physia/features/courses/presentation/widgets/courses_states/courses_message_card.dart';
import 'package:flutter/material.dart';

class CoursesFailureState extends StatelessWidget {
  const CoursesFailureState({super.key, required this.onRetryPressed});

  final VoidCallback onRetryPressed;

  @override
  Widget build(BuildContext context) {
    return CoursesMessageCard(
      title: 'تعذّر تحميل الكورسات',
      description: 'تحقق من اتصالك ثم أعد المحاولة.',
      onPressed: onRetryPressed,
      buttonText: 'إعادة المحاولة',
    );
  }
}
