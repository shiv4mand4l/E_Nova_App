abstract interface class OnboardingRepository {
  Future<bool> isLoggedIn();
  Future<bool> isOnboardingCompleted();
}
