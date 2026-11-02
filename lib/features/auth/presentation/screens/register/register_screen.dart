import 'package:bta3_physia/core/helper/app_system_ui.dart';
import 'package:bta3_physia/features/auth/presentation/widgets/register_widgets/register_screen_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppSystemUi.dark(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: RegisterScreenContent(),
      ),
    );
  }
}
