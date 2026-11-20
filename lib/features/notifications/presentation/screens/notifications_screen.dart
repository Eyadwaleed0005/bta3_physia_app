import 'package:bta3_physia/core/helper/app_system_ui.dart';
import 'package:bta3_physia/core/widgets/background/app_screen_backdrop.dart';
import 'package:bta3_physia/features/notifications/presentation/widgets/notifications_screen_content_widgets/notifications_screen_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({
    super.key,
    /* this.initialMode = NotificationsViewMode.list,
    this.initialFilter = NotificationFilter.all, */
  });

  //maybe need it when opening notifications from notification center

  /* final NotificationsViewMode initialMode;
  final NotificationFilter initialFilter; */

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppSystemUi.dark(),
      child: AppScreenBackdrop(
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: NotificationsScreenContent(),
          ),
        ),
      ),
    );
  }
}
