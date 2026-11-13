import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/widgets/custom_app_bar.dart';
import 'package:bta3_physia/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:bta3_physia/features/profile/presentation/cubit/profile_state.dart';
import 'package:bta3_physia/features/profile/presentation/widgets/profile_screen_content_widgets/profile_body_for_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreenContent extends StatelessWidget {
  const ProfileScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomAppBar(
                title: _titleFor(state.viewMode),
                subTitle: _subtitleFor(state.viewMode),
                showContentOnly: false,
                icon: Icons.refresh,
                iconTap: () => context.read<ProfileCubit>().refresh(),
              ),
              verticalSpace(16),
              Expanded(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: ProfileBodyForMode(state: state),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _titleFor(ProfileViewMode mode) {
    switch (mode) {
      case ProfileViewMode.missing:
        return 'أكمل حسابك';
      default:
        return 'حسابي';
    }
  }

  String _subtitleFor(ProfileViewMode mode) {
    switch (mode) {
      case ProfileViewMode.processing:
        return 'جار تنفيذ طلبك';
      case ProfileViewMode.missing:
        return 'بياناتك غير مكتملة';
      case ProfileViewMode.feedback:
        return 'حالة الحساب';
      case ProfileViewMode.overview:
        return 'بياناتك وإعدادات التعلم';
    }
  }
}
