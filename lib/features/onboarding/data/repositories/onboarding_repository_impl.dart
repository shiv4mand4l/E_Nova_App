import 'package:e_nova/features/onboarding/data/local/onboarding_local_data_source.dart';
import 'package:e_nova/features/onboarding/domain/repositories/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingLocalDataSource onboardingLocalDataSource;

  OnboardingRepositoryImpl(this.onboardingLocalDataSource);
  @override
  Future<bool> isLoggedIn() {
    return onboardingLocalDataSource.isLoggedIn();
  }

  @override
  Future<bool> isOnboardingCompleted() {
    return onboardingLocalDataSource.isOnboardingCompleated();
  }
}
