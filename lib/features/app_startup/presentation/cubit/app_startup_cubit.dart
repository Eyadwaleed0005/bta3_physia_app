import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/complete_onboarding.dart';
import '../../domain/use_cases/is_onboarding_completed.dart';
import 'app_startup_state.dart';

class AppStartupCubit extends Cubit<AppStartupState> {
  AppStartupCubit(this._isOnboardingCompleted, this._completeOnboarding)
    : super(const AppStartupInitial());

  final IsOnboardingCompleted _isOnboardingCompleted;
  final CompleteOnboarding _completeOnboarding;

  bool get _isBusy =>
      state is OnboardingChecking || state is OnboardingCompleting;

  Future<void> checkOnboarding() async {
    if (_isBusy) return;

    emit(const OnboardingChecking());
    final result = await _isOnboardingCompleted();

    if (isClosed) return;

    final shouldContinue = result.getOrElse(() => true);

    emit(
      shouldContinue ? const AppStartupContinue() : const OnboardingRequired(),
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
