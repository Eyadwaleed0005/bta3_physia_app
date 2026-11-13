import 'package:bta3_physia/app/dependency_injection/service_locator.dart';
import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/core/transition/app_transition.dart';
import 'package:bta3_physia/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:bta3_physia/features/profile/presentation/screens/accounts_screen.dart';
import 'package:bta3_physia/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:bta3_physia/features/profile/presentation/screens/logout_screen.dart';
import 'package:bta3_physia/features/profile/presentation/screens/profile_picture_screen.dart';
import 'package:bta3_physia/features/profile/presentation/screens/verify_identity_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract final class ProfileRoutes {
  const ProfileRoutes._();

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.accountsScreen:
        return AppTransition.simpleTransition(
          settings: settings,
          screen: _withProfileCubit(const AccountsScreen()),
        );

      case RouteNames.editProfileScreen:
        return AppTransition.simpleTransition(
          settings: settings,
          screen: _withProfileCubit(const EditProfileScreen()),
        );

      case RouteNames.profilePictureScreen:
        return AppTransition.simpleTransition(
          settings: settings,
          screen: _withProfileCubit(const ProfilePictureScreen()),
        );

      case RouteNames.verifyIdentityScreen:
        return AppTransition.simpleTransition(
          settings: settings,
          screen: _withProfileCubit(const VerifyIdentityScreen()),
        );

      case RouteNames.logoutScreen:
        return AppTransition.simpleTransition(
          settings: settings,
          screen: _withProfileCubit(const LogoutScreen()),
        );

      default:
        return null;
    }
  }

  static Widget _withProfileCubit(Widget child) {
    return BlocProvider<ProfileCubit>.value(
      value: getIt<ProfileCubit>(),
      child: child,
    );
  }
}
