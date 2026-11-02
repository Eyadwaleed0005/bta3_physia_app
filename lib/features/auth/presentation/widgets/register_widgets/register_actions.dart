import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/features/auth/presentation/widgets/auth_widgets/auth_link_text.dart';
import 'package:bta3_physia/features/auth/presentation/widgets/auth_widgets/auth_primary_button.dart';
import 'package:flutter/material.dart';

class RegisterActions extends StatelessWidget {
  const RegisterActions({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  });

  final String label;
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        AuthPrimaryButton(
          label: label,
          onPressed: onPressed,
          isLoading: isLoading,
        ),
        verticalSpace(16),
        AuthLinkText(
          leading: 'لديك حساب بالفعل؟',
          action: 'سجّل دخولك',
          style: AppTextStyle.font16TextSecondaryBoldTajawal(),
          onTap: () => Navigator.of(context).maybePop(),
        ),
      ],
    );
  }
}
