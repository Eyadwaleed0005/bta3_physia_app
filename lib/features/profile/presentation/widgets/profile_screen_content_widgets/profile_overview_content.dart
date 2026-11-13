import 'package:bta3_physia/app/routes/app_images_routes.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/features/profile/data/models/profile_account_model.dart';
import 'package:bta3_physia/features/profile/presentation/widgets/profile_screen_content_widgets/profile_card.dart';
import 'package:bta3_physia/features/profile/presentation/widgets/profile_screen_content_widgets/profile_info_tile.dart';
import 'package:flutter/material.dart';

class ProfileOverviewContent extends StatelessWidget {
  const ProfileOverviewContent({
    super.key,
    required this.account,
    this.onAvatarTap,
    this.onChangePhotoTap,
    this.onPersonalDataTap,
    this.onLogoutTap,
  });

  final ProfileAccountModel account;
  final VoidCallback? onAvatarTap;
  final VoidCallback? onChangePhotoTap;
  final VoidCallback? onPersonalDataTap;
  final VoidCallback? onLogoutTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Profile card
        ProfileCard(
          account: account,
          onAvatarTap: onAvatarTap,
          onChangePhotoTap: onChangePhotoTap,
        ),
        verticalSpace(24),
        ProfileInfoTile(
          title: 'البيانات الشخصية',
          subtitle: 'الاسم والبريد الإلكتروني',
          showChevron: true,
          onTap: onPersonalDataTap,
          icon: Icons.person_outline,
        ),
        verticalSpace(20),
        //subtitle will be replaced from api
        ProfileInfoTile(
          title: 'الصف الدراسي المسجّل',
          subtitle: account.grade,
          svg: AppImage().graduation,
        ),
        verticalSpace(20),
        // Logout
        ProfileInfoTile(
          title: 'تسجيل الخروج',
          subtitle: 'تبقى بياناتك محفوظة في حسابك',
          onTap: onLogoutTap,
          showChevron: true,
          icon: Icons.logout,
        ),
        verticalSpace(16),
        Text(
          'اضغط على صورة الحساب للتبديل بين حساباتك.',
          textAlign: TextAlign.right,
          style: AppTextStyle.font14TextMutedRegularTajawal(),
        ),
      ],
    );
  }
}
