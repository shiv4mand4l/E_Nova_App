enum AppStartStatus { onboarding, login, home }

abstract interface class SplashRepository {
  Future<AppStartStatus> checkStatus();
}
