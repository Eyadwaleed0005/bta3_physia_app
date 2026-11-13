import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/core/helper/app_system_ui.dart';
import 'package:bta3_physia/core/widgets/background/app_screen_backdrop.dart';
import 'package:bta3_physia/features/profile/presentation/widgets/logout_screen_content_widgets/logout_screen_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppSystemUi.dark(),
      child: AppScreenBackdrop(
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: LogoutScreenContent(
              onLogoutPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  RouteNames.loginScreen,
                  (route) => false,
                );
              },
              onStayPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
      ),
    );
  }
}
