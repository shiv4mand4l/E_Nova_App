import 'package:e_nova/features/onboarding/domain/repositories/onboarding_repository.dart';

class CheckAuthStatusUsecase {
  final OnboardingRepository onboardingRepository;

  CheckAuthStatusUsecase(this.onboardingRepository);

  Future<(bool onboarding, bool login)> call() async {
    final onboarding = await onboardingRepository.isOnboardingCompleted();
    final login = await onboardingRepository.isLoggedIn();

    return (onboarding, login);
  }
}
