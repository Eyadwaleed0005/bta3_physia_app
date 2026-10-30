import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key, required this.onSkip, required this.enabled});

  final VoidCallback onSkip;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54.h,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: enabled ? onSkip : null,
              behavior: HitTestBehavior.opaque,
              child: Text(
                'تخطي',
                style: AppTextStyle.font15TextLightBoldTajawal(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: SvgPicture.asset(
              'assets/images/onboarding_wordmark.svg',
              height: 54.h,
            ),
          ),
        ],
      ),
    );
  }
}
