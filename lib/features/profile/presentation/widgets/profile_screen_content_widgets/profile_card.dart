import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/features/profile/data/models/profile_account_model.dart';
import 'package:bta3_physia/features/profile/presentation/widgets/profile_screen_content_widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileCard extends StatelessWidget {
  final ProfileAccountModel account;
  final VoidCallback? onAvatarTap;
  final VoidCallback? onChangePhotoTap;

  const new({
    super.key,
    required this.account,
    required this.onAvatarTap,
    required this.onChangePhotoTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: ColorPalette.panelGlass,
        borderRadius: BorderRadius.circular(16.r),
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
                  style: AppTextStyle.font20TextLightBoldTajawal(),
                ),
                verticalSpace(4),
                Text(
                  account.email,
                  textAlign: TextAlign.right,
                  style: AppTextStyle.font14TextMutedRegularTajawal(),
                ),
                verticalSpace(6),
                GestureDetector(
                  onTap: onChangePhotoTap,
                  child: Text(
                    'تغيير الصورة',
                    style: AppTextStyle.font13TextSecondaryBoldTajawal(),
                  ),
                ),
              ],
            ),
          ),
          horizontalSpace(16),
          ProfileAvatar(
            size: 80,
            avatarIndex: account.avatarIndex,
            onTap: onAvatarTap,
            showSwapButton: true,
          ),
        ],
      ),
    );
  }
}
