import 'dart:async';

import 'package:bta3_physia/features/live/presentation/cubit/live_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LiveCubit extends Cubit<LiveState> {
  LiveCubit() : super(LiveState());

  static const Duration openingHandoffDuration = Duration(seconds: 4);

  static const Duration _refreshDuration = Duration(milliseconds: 600);

  Timer? _openingTimer;

  void setViewMode(LiveViewMode mode) {
    _cancelOpeningTimer();
    emit(state.copyWith(viewMode: mode));
  }

  void refresh() {
    _cancelOpeningTimer();
    emit(state.copyWith(viewMode: LiveViewMode.loading));
    Future.delayed(_refreshDuration, () {
      if (!isClosed) {
        emit(state.copyWith(viewMode: LiveViewMode.available));
      }
    });
  }

  void joinLive() {
    _cancelOpeningTimer();
    emit(state.copyWith(viewMode: LiveViewMode.opening));
    _openingTimer = Timer(openingHandoffDuration, () {
      if (!isClosed) {
        emit(state.copyWith(viewMode: LiveViewMode.available));
      }
    });
  }

  void returnToStream() {
    _cancelOpeningTimer();
    emit(state.copyWith(viewMode: LiveViewMode.available));
  }

  void _cancelOpeningTimer() {
    _openingTimer?.cancel();
    _openingTimer = null;
  }

  @override
  Future<void> close() {
    _cancelOpeningTimer();
    return super.close();
  }
}
