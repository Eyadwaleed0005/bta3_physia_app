import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/features/profile/data/models/profile_account_model.dart';
import 'package:bta3_physia/features/profile/presentation/widgets/profile_screen_content_widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({
    super.key,
    required this.account,
    this.isActive = false,
    this.onTap,
  });

  final ProfileAccountModel account;
  final bool isActive;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: ColorPalette.panelGlass,
          borderRadius: BorderRadius.circular(16.r),
          border: isActive ? Border.all(color: ColorPalette.accent) : null,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    account.name,
                    textAlign: TextAlign.right,
                    style: AppTextStyle.font16TextLightBoldTajawal(),
                  ),
                  verticalSpace(4),
                  Text(
                    account.email,
                    textAlign: TextAlign.right,
                    style: AppTextStyle.font13TextMutedRegularTajawal(),
                  ),
                  verticalSpace(6),
                  Text(
                    account.grade,
                    textAlign: TextAlign.right,
                    style: AppTextStyle.font12TextMutedRegularTajawal(),
                  ),
                ],
              ),
            ),
            horizontalSpace(16),
            Stack(
              clipBehavior: Clip.none,
              children: [
                ProfileAvatar(size: 48, avatarIndex: account.avatarIndex),
                if (isActive)
                  Positioned(
                    left: -2,
                    bottom: -2,
                    child: Container(
                      width: 20.w,
                      height: 20.h,
                      decoration: const BoxDecoration(
                        color: ColorPalette.accent,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.check_rounded,
                        size: 14.r,
                        color: ColorPalette.textPrimary,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
