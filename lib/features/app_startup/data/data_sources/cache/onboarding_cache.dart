abstract interface class OnboardingCache {
  Future<bool> isCompleted();

  Future<void> markCompleted();
}
