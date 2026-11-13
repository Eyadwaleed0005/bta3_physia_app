import 'package:bta3_physia/features/profile/data/models/profile_account_model.dart';
import 'package:equatable/equatable.dart';

enum ProfileViewMode { overview, processing, missing, feedback }

class ProfileState extends Equatable {
  const ProfileState({
    this.viewMode = ProfileViewMode.overview,
    this.accounts = const [],
    this.activeAccountIndex = 0,
    this.draftName,
    this.draftEmail,
  });

  final ProfileViewMode viewMode;
  final List<ProfileAccountModel> accounts;
  final int activeAccountIndex;
  final String? draftName;
  final String? draftEmail;

  ProfileAccountModel get activeAccount => accounts[activeAccountIndex];

  String get draftNameOrActive => draftName ?? activeAccount.name;

  String get draftEmailOrActive => draftEmail ?? activeAccount.email;

  ProfileState copyWith({
    ProfileViewMode? viewMode,
    List<ProfileAccountModel>? accounts,
    int? activeAccountIndex,
    String? draftName,
    String? draftEmail,
  }) {
    return ProfileState(
      viewMode: viewMode ?? this.viewMode,
      accounts: accounts ?? this.accounts,
      activeAccountIndex: activeAccountIndex ?? this.activeAccountIndex,
      draftName: draftName ?? this.draftName,
      draftEmail: draftEmail ?? this.draftEmail,
    );
  }

  @override
  List<Object?> get props => [
    viewMode,
    accounts,
    activeAccountIndex,
    draftName,
    draftEmail,
  ];
}
