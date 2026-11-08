import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/features/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:bta3_physia/features/notifications/presentation/cubit/notifications_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationSubHeader extends StatelessWidget {
  final NotificationsState state;
  const NotificationSubHeader({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NotificationsCubit>();
    final count = state.unreadCount;
    final unreadText = count == 0
        ? 'لا توجد إشعارات غير مقروءة'
        : 'إشعارات غير مقروءة';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(unreadText, style: AppTextStyle.font13TextMutedRegularTajawal()),
        if (count > 0)
          GestureDetector(
            onTap: () => cubit.markAllAsRead(),
            child: Text(
              'اعتبار الكل مقروءًا',
              style: AppTextStyle.font13TextSecondaryBoldTajawal(),
            ),
          ),
        if (count == 0) SizedBox.shrink(),
      ],
    );
  }
}
