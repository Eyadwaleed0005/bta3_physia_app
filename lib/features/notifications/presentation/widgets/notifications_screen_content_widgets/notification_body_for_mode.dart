import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/features/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:bta3_physia/features/notifications/presentation/cubit/notifications_state.dart';
import 'package:bta3_physia/features/notifications/presentation/widgets/notifications_screen_content_widgets/notification_item_card.dart';
import 'package:bta3_physia/features/notifications/presentation/widgets/notification_states/notifications_empty_state.dart';
import 'package:bta3_physia/features/notifications/presentation/widgets/notification_states/notifications_failure_state.dart';
import 'package:bta3_physia/features/notifications/presentation/widgets/notification_states/notifications_loading_state.dart';
import 'package:bta3_physia/features/notifications/presentation/widgets/notification_states/notifications_permission_state.dart';
import 'package:bta3_physia/features/notifications/presentation/widgets/notification_states/notifications_unavailable_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationBodyForMode extends StatelessWidget {
  final NotificationsState state;
  const NotificationBodyForMode({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NotificationsCubit>();

    switch (state.viewMode) {
      case NotificationsViewMode.loading:
        return Padding(
          padding: EdgeInsets.only(top: 24.h),
          child: const NotificationsLoadingState(),
        );

      case NotificationsViewMode.empty:
        return Padding(
          padding: EdgeInsets.only(top: 24.h),
          child: NotificationsEmptyState(
            onRefreshPressed: () => cubit.refresh(),
          ),
        );

      case NotificationsViewMode.permission:
        return Padding(
          padding: EdgeInsets.only(top: 24.h),
          child: NotificationsPermissionState(
            onAllowPressed: () {
              cubit.setViewMode(NotificationsViewMode.list);
            },
            onNotNowPressed: () {
              Navigator.pop(context);
            },
          ),
        );

      case NotificationsViewMode.failure:
        return Padding(
          padding: EdgeInsets.only(top: 24.h),
          child: NotificationsFailureState(
            onRetryPressed: () => cubit.refresh(),
            onReturnHomePressed: () => Navigator.pop(context),
          ),
        );

      case NotificationsViewMode.unavailable:
        return Padding(
          padding: EdgeInsets.only(top: 24.h),
          child: NotificationsUnavailableState(
            onReturnPressed: () {
              cubit.setViewMode(NotificationsViewMode.list);
            },
          ),
        );

      case NotificationsViewMode.list:
        final items = state.filteredItems;
        if (items.isEmpty) {
          return Padding(
            padding: EdgeInsets.only(top: 24.h),
            child: NotificationsEmptyState(
              title: state.filter == NotificationFilter.unreadOnly
                  ? 'لا توجد إشعارات غير مقروءة'
                  : 'لا توجد إشعارات حاليًا',
              subtitle: state.filter == NotificationFilter.unreadOnly
                  ? 'لقد اطّلعت على جميع الإشعارات المتاحة لصفّك.'
                  : 'سيظهر هنا كل جديد لصفّك من كورسات ودروس وامتحانات وبث مباشر.',
              onRefreshPressed: () => cubit.refresh(),
            ),
          );
        }

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          separatorBuilder: (context, index) => verticalSpace(12),
          itemBuilder: (context, index) {
            final item = items[index];
            return NotificationItemCard(
              item: item,
              onTap: () {
                cubit.markItemAsRead(item.id);
                /* if (item.type == NotificationType.live) {
                  // If live ended or unavailable test
                } */
              },
            );
          },
        );
    }
  }
}
