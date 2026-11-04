import 'package:bta3_physia/features/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({HomeViewMode initialMode = HomeViewMode.contentWithLive})
    : super(HomeState(viewMode: initialMode));

  void setViewMode(HomeViewMode mode) {
    emit(state.copyWith(viewMode: mode));
  }

  void refresh() {
    emit(state.copyWith(viewMode: HomeViewMode.loading));
    Future.delayed(const Duration(milliseconds: 2000), () {
      if (!isClosed) {
        emit(state.copyWith(viewMode: HomeViewMode.contentWithLive));
      }
    });
  }

  void markNotificationsRead() {
    emit(state.copyWith(unreadNotificationsCount: 0));
  }
}
