import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:flutter/material.dart';

/// The heading block of every auth screen: a 26 pt Alexandria title over a
/// 17 pt muted line.
class AuthMessage extends StatelessWidget {
  const AuthMessage({
    super.key,
    required this.title,
    required this.subtitle,
    this.textAlign = TextAlign.right,
  });

  final String title;
  final String subtitle;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          title,
          textAlign: textAlign,
          style: AppTextStyle.font26TextLightBoldAlexandria(),
        ),
        verticalSpace(8),
        Text(
          subtitle,
          textAlign: textAlign,
          style: AppTextStyle.font17TextMutedRegularTajawal(),
        ),
      ],
    );
  }
}