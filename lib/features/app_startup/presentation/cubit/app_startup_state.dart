sealed class AppStartupState {
  const AppStartupState();
}

final class AppStartupInitial extends AppStartupState {
  const AppStartupInitial();
}

final class OnboardingChecking extends AppStartupState {
  const OnboardingChecking();
}

final class OnboardingRequired extends AppStartupState {
  const OnboardingRequired();
}

final class OnboardingCompleting extends AppStartupState {
  const OnboardingCompleting();
}

final class AppStartupContinue extends AppStartupState {
  const AppStartupContinue();
}
