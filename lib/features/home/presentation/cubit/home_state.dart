import 'package:equatable/equatable.dart';

enum HomeViewMode {
  contentWithLive,
  contentNoLive,
  emptyGrade,
  failure,
  loading,
}

class HomeState extends Equatable {
  const HomeState({
    this.viewMode = HomeViewMode.contentWithLive,
    this.userName = 'أحمد محمد',
    this.unreadNotificationsCount = 2,
  });

  final HomeViewMode viewMode;
  final String userName;
  final int unreadNotificationsCount;

  HomeState copyWith({
    HomeViewMode? viewMode,
    String? userName,
    int? unreadNotificationsCount,
  }) {
    return HomeState(
      viewMode: viewMode ?? this.viewMode,
      userName: userName ?? this.userName,
      unreadNotificationsCount:
          unreadNotificationsCount ?? this.unreadNotificationsCount,
    );
  }

  @override
  List<Object?> get props => [viewMode, userName, unreadNotificationsCount];
}
