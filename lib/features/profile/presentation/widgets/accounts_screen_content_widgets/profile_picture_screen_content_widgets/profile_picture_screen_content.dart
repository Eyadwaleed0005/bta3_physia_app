import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/core/widgets/custom_app_bar.dart';
import 'package:bta3_physia/core/widgets/custom_button.dart';
import 'package:bta3_physia/core/widgets/custom_secondary_button.dart';
import 'package:bta3_physia/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:bta3_physia/features/profile/presentation/widgets/profile_screen_content_widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePictureScreenContent extends StatefulWidget {
  const ProfilePictureScreenContent({super.key});

  @override
  State<ProfilePictureScreenContent> createState() =>
      _ProfilePictureScreenContentState();
}

class _ProfilePictureScreenContentState
    extends State<ProfilePictureScreenContent> {
  late int _selectedAvatarIndex;
  static const Duration _saveDuration = Duration(milliseconds: 700);

  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _selectedAvatarIndex = context
        .read<ProfileCubit>()
        .state
        .activeAccount
        .avatarIndex;
  }

  Future<void> _handleSave() async {
    if (_isSaving) {
      return;
    }

    setState(() => _isSaving = true);

    await Future.delayed(_saveDuration);

    if (!mounted) {
      return;
    }

    context.read<ProfileCubit>().saveProfilePhoto(
      avatarIndex: _selectedAvatarIndex,
    );
    Navigator.of(context).pop();
  }

  void _handleSelectAvatar(int index) {
    if (_isSaving || index == _selectedAvatarIndex) {
      return;
    }

    setState(() => _selectedAvatarIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const CustomAppBar(
            title: 'الصورة الشخصية',
            subTitle: 'اختر صورة لحسابك',
          ),
          verticalSpace(16),
          Expanded(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'سنحفظ الصورة في هذا الحساب فقط.',
                    textAlign: TextAlign.right,
                    style: AppTextStyle.font14TextMutedRegularTajawal(),
                  ),

                  verticalSpace(24),
                  Row(
                    children: [
                      for (
                        int index = 0;
                        index < ProfileAvatar.avatarsCount;
                        index++
                      )
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.w),
                            child: _AvatarChoice(
                              avatarIndex: index,
                              isSelected: index == _selectedAvatarIndex,
                              onTap: _isSaving
                                  ? null
                                  : () => _handleSelectAvatar(index),
                            ),
                          ),
                        ),
                    ],
                  ),
                  verticalSpace(36),
                  CustomSecondaryButton(
                    onPressed: _isSaving ? null : () => _handleSelectAvatar(0),
                    height: 48.h,
                    borderRadius: 24.r,
                    text: 'استخدام الصورة الافتراضية',
                    textStyle: AppTextStyle.font15TextLightBoldTajawal(),
                    borderWidth: 0,
                    backgroundColor: ColorPalette.fieldFill,
                    foregroundColor: ColorPalette.textLight,
                  ),
                  verticalSpace(12),
                  CustomButton(
                    onPressed: _handleSave,
                    isLoading: _isSaving,
                    titleForRefreash: 'جارٍ الحفظ',
                    height: 48.h,
                    background: ColorPalette.accent,
                    foreground: ColorPalette.textPrimary,
                    borderRadius: 24.r,
                    text: 'حفظ الصورة',
                    textStyle: AppTextStyle.font16TextPrimaryBoldTajawal(),
                  ),
                  verticalSpace(8),
                  Center(
                    child: TextButton(
                      onPressed: _isSaving
                          ? null
                          : () => Navigator.pop(context),
                      child: Text(
                        'إلغاء',
                        style: AppTextStyle.font14TextSecondaryBoldTajawal(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AvatarChoice extends StatelessWidget {
  const _AvatarChoice({
    required this.avatarIndex,
    required this.isSelected,
    this.onTap,
  });

  final int avatarIndex;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 130.h,
        padding: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
          color: ColorPalette.fieldFill,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfileAvatar(size: 80, avatarIndex: avatarIndex),
            verticalSpace(8),
            isSelected
                ? Expanded(
                    child: Icon(
                      Icons.check_circle,
                      color: ColorPalette.accent,
                      size: 24,
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
