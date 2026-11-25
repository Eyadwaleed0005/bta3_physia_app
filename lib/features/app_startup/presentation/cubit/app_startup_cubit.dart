import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/check_saved_session.dart';
import '../../domain/use_cases/complete_onboarding.dart';
import '../../domain/use_cases/is_onboarding_completed.dart';
import 'app_startup_state.dart';

class AppStartupCubit extends Cubit<AppStartupState> {
  AppStartupCubit(
    this._isOnboardingCompleted,
    this._completeOnboarding,
    this._checkSavedSession,
  ) : super(const AppStartupInitial());

  final IsOnboardingCompleted _isOnboardingCompleted;
  final CompleteOnboarding _completeOnboarding;
  final CheckSavedSession _checkSavedSession;

  bool get _isBusy =>
      state is OnboardingChecking || state is OnboardingCompleting;

  Future<void> checkOnboarding() async {
    if (_isBusy) return;

    emit(const OnboardingChecking());

    final session = await _checkSavedSession();
    if (isClosed) return;

    await session.fold<Future<void>>(
      (error) async {
        emit(AppStartupSessionCheckFailed(error.message));
      },
      (hasSavedSession) async {
        if (hasSavedSession) {
          emit(const AppStartupAuthenticated());
          return;
        }

        final onboarding = await _isOnboardingCompleted();
        if (isClosed) return;

        emit(
          onboarding.getOrElse(() => true)
              ? const AppStartupContinue()
              : const OnboardingRequired(),
        );
      },
    );
  }

  Future<void> completeOnboarding() async {
    if (_isBusy || state is AppStartupContinue) return;

    emit(const OnboardingCompleting());
    await _completeOnboarding();

    if (isClosed) return;

    emit(const AppStartupContinue());
  }
}
