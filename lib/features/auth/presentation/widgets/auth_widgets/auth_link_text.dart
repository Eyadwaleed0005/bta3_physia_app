import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthLinkText extends StatelessWidget {
  const AuthLinkText({
    super.key,
    required this.action,
    required this.onTap,
    this.leading,
    this.style,
  });

  final String? leading;
  final String action;
  final VoidCallback onTap;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle =
        style ?? AppTextStyle.font16TextSecondaryBoldTajawal();

    return Center(
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12.r),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: Text.rich(
              TextSpan(
                style: textStyle,
                children: <InlineSpan>[
                  if (leading != null && leading!.isNotEmpty)
                    TextSpan(text: '$leading  '),
                  TextSpan(text: action),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
