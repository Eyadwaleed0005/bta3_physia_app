import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileInfoTile extends StatelessWidget {
  const ProfileInfoTile({
    super.key,
    required this.title,
    this.subtitle,
    this.onTap,
    this.showChevron = false,
    this.icon,
    this.svg,
  });

  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final bool showChevron;
  final IconData? icon;
  final String? svg;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: ColorPalette.fieldFill,
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Row(
          children: [
            if (showChevron) ...[
              Icon(
                Icons.arrow_back_ios_rounded,
                size: 16.r,
                color: ColorPalette.textSecondary,
              ),
              horizontalSpace(8),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.right,
                    style: AppTextStyle.font15TextLightBoldTajawal(),
                  ),
                  if (subtitle != null) ...[
                    verticalSpace(4),
                    Text(
                      subtitle!,
                      textAlign: TextAlign.right,
                      style: AppTextStyle.font12TextMutedRegularTajawal(),
                    ),
                  ],
                ],
              ),
            ),
            if (icon != null) ...[
              horizontalSpace(8),
              Icon(icon, size: 28.r, color: ColorPalette.textSecondary),
            ],
            if (svg != null) ...[
              horizontalSpace(8),
              SvgPicture.asset(svg!, width: 24.w, height: 24.h),
            ],
          ],
        ),
      ),
    );
  }
}
