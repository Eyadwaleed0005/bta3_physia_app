import 'package:bta3_physia/features/auth/presentation/widgets/auth_widgets/auth_back_button.dart';
import 'package:bta3_physia/features/auth/presentation/widgets/auth_widgets/auth_brand_mark.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const AuthBrandMark(),
        const Spacer(),
        AuthBackButton(onPressed: onBack),
      ],
    );
  }
}
