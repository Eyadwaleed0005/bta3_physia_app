import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/features/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:bta3_physia/features/notifications/presentation/cubit/notifications_state.dart';
import 'package:bta3_physia/features/notifications/presentation/widgets/notifications_screen_content_widgets/notification_app_bar.dart';
import 'package:bta3_physia/features/notifications/presentation/widgets/notifications_screen_content_widgets/notification_filter_tabs.dart';
import 'package:bta3_physia/features/notifications/presentation/widgets/notifications_screen_content_widgets/notification_body_for_mode.dart';
import 'package:bta3_physia/features/notifications/presentation/widgets/notifications_screen_content_widgets/notification_sub_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsScreenContent extends StatelessWidget {
  const NotificationsScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        final isPermissionState =
            state.viewMode == NotificationsViewMode.permission;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // App Bar
              NotificationAppBar(state: state, isPermission: isPermissionState),

              verticalSpace(16),

              // Filter Tabs (only in list mode)
              if (state.viewMode == NotificationsViewMode.list) ...[
                NotificationFilterTabs(state: state),
                verticalSpace(14),
                NotificationSubHeader(state: state),
                verticalSpace(14),
              ],

              // Main Content
              Expanded(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: NotificationBodyForMode(state: state),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
