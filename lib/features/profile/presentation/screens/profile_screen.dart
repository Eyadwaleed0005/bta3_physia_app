import 'package:bta3_physia/core/helper/app_system_ui.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppSystemUi.dark(),
      child: Scaffold(
        backgroundColor: ColorPalette.screenBackground,
        body: Center(
          child: Text(
            'profile screen',
            style: AppTextStyle.font22TextLightBoldTajawal(),
          ),
        ),
      ),
    );
  }
}
