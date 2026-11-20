import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:bta3_physia/features/profile/presentation/cubit/profile_state.dart';
import 'package:bta3_physia/features/profile/presentation/widgets/profile_screen_content_widgets/profile_overview_content.dart';
import 'package:bta3_physia/features/profile/presentation/widgets/profile_states/profile_feedback_state.dart';
import 'package:bta3_physia/features/profile/presentation/widgets/profile_states/profile_missing_state.dart';
import 'package:bta3_physia/features/profile/presentation/widgets/profile_states/profile_processing_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBodyForMode extends StatelessWidget {
  final ProfileState state;
  const ProfileBodyForMode({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();

    switch (state.viewMode) {
      case ProfileViewMode.overview:
        return ProfileOverviewContent(
          account: state.activeAccount,
          onAvatarTap: () {
            Navigator.of(context).pushNamed(RouteNames.accountsScreen);
          },
          onChangePhotoTap: () {
            Navigator.of(context).pushNamed(RouteNames.profilePictureScreen);
          },
          onPersonalDataTap: () {
            Navigator.of(context).pushNamed(RouteNames.editProfileScreen);
          },
          onLogoutTap: () {
            Navigator.of(context).pushNamed(RouteNames.logoutScreen);
          },
        );

      case ProfileViewMode.processing:
        return const ProfileProcessingState();

      case ProfileViewMode.missing:
        return ProfileMissingState(
          onCompleteDataPressed: () {
            Navigator.of(context).pushNamed(RouteNames.editProfileScreen);
          },
          onSwitchAccountsPressed: () {
            Navigator.of(context).pushNamed(RouteNames.accountsScreen);
          },
        );

      case ProfileViewMode.feedback:
        return ProfileFeedbackState(
          onRetryPressed: () => cubit.refresh(),
          onChooseAccountPressed: () {
            Navigator.of(context).pushNamed(RouteNames.accountsScreen);
          },
        );
    }
  }
}
