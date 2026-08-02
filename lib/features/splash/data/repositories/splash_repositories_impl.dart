import 'package:e_nova/features/splash/data/datasources/local/splash_local_data_source.dart';
import 'package:e_nova/features/splash/domain/repositories/splash_repository.dart';

class SplashRepositoriesImpl implements SplashRepository {
  final SplashLocalDataSource splashLocalDataSource;

  SplashRepositoriesImpl(this.splashLocalDataSource);
  @override
  Future<AppStartStatus> checkStatus() async {
    final onBoardingCompleted = await splashLocalDataSource
        .isOnboardingCompleted();

    if (!onBoardingCompleted) {
      return AppStartStatus.onboarding;
    }

    final isLoggedIn = await splashLocalDataSource.isLoggedIn();

    if (isLoggedIn) {
      return AppStartStatus.home;
    }
    return AppStartStatus.login;
  }
}
