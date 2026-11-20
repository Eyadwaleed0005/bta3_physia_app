import 'dart:async';

import 'package:bta3_physia/features/profile/data/models/profile_account_model.dart';
import 'package:bta3_physia/features/profile/presentation/cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({
    List<ProfileAccountModel>? accounts,
    int initialAccountIndex = 0,
  }) : super(
         ProfileState(
           accounts: accounts ?? ProfileAccountModel.defaultAccounts(),
           activeAccountIndex: initialAccountIndex,
         ),
       );

  static const Duration initialLoadDuration = Duration(milliseconds: 900);

  static const Duration saveDuration = Duration(milliseconds: 700);

  Timer? _timer;

  void setViewMode(ProfileViewMode mode) {
    _cancelTimer();
    emit(state.copyWith(viewMode: mode));
  }

  void refresh() {
    _cancelTimer();
    emit(state.copyWith(viewMode: ProfileViewMode.processing));
    _timer = Timer(initialLoadDuration, () {
      if (!isClosed) {
        emit(state.copyWith(viewMode: ProfileViewMode.overview));
      }
    });
  }

  void switchAccount(int index) {
    if (index < 0 || index >= state.accounts.length) {
      return;
    }

    emit(
      state.copyWith(
        activeAccountIndex: index,
        viewMode: ProfileViewMode.overview,
      ),
    );
  }

  void prepareEditDraft({required String name, required String email}) {
    emit(state.copyWith(draftName: name, draftEmail: email));
  }

  void saveProfilePhoto({required int avatarIndex}) {
    final int index = state.activeAccountIndex;
    final List<ProfileAccountModel> updated = [...state.accounts];
    updated[index] = updated[index].copyWith(avatarIndex: avatarIndex);

    emit(state.copyWith(accounts: updated, viewMode: ProfileViewMode.overview));
  }

  void saveProfile() {
    _cancelTimer();

    final int index = state.activeAccountIndex;
    final List<ProfileAccountModel> updated = [...state.accounts];
    updated[index] = updated[index].copyWith(
      name: state.draftNameOrActive,
      email: state.draftEmailOrActive,
    );

    emit(
      state.copyWith(accounts: updated, viewMode: ProfileViewMode.processing),
    );

    _timer = Timer(saveDuration, () {
      if (!isClosed) {
        emit(state.copyWith(viewMode: ProfileViewMode.overview));
      }
    });
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  Future<void> close() {
    _cancelTimer();
    return super.close();
  }
}
