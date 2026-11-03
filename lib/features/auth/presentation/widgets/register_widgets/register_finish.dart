import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/features/auth/presentation/widgets/register_widgets/header.dart';
import 'package:bta3_physia/features/auth/presentation/widgets/register_widgets/register_actions.dart';
import 'package:bta3_physia/features/auth/presentation/widgets/register_widgets/register_success_mark.dart';
import 'package:flutter/material.dart';

/// `Register 04 / Success` — the screen the register flow ends on once the
/// account exists. It keeps the flow's header but drops the step progress, and
/// both of its calls to action lead to login.
///
/// The gaps are Figma's own on the 390 × 844 frame: the confirmation mark at
/// y 232, the title at 460, the message at 516 and the actions at 684, which
/// come out as 114 / 36 / 12 / 114 between the blocks. Everything is `.h`, so
/// the rhythm scales with the screen instead of drifting.
class RegisterFinish extends StatelessWidget {
  const RegisterFinish({
    super.key,
    required this.onBack,
    required this.onSignIn,
  });

  final VoidCallback onBack;
  final VoidCallback onSignIn;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        verticalSpace(17),
        Header(onBack: onBack),
        verticalSpace(114),
        const Center(child: RegisterSuccessMark()),
        verticalSpace(36),
        Text(
          'حسابك جاهز!',
          textAlign: TextAlign.center,
          style: AppTextStyle.font29TextLightBoldAlexandria(),
        ),
        verticalSpace(12),
        // Figma's box for this copy is one line tall, but the text carries a
        // break, so its second line spills into the gap below — which is why
        // the actions sit 114 pt away rather than 141.
        Text(
          'أُنشئ حسابك بنجاح.\nسجّل دخولك لبدء رحلة التعلّم.',
          textAlign: TextAlign.center,
          style: AppTextStyle.font18TextMutedRegularTajawal(),
        ),
        verticalSpace(114),
        RegisterActions(
          label: 'تسجيل الدخول',
          onPressed: onSignIn,
          onSignIn: onSignIn,
        ),
        const Spacer(),
      ],
    );
  }
}