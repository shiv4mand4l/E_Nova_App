import 'package:e_nova/features/splash/domain/repositories/splash_repository.dart';

class CheckAppStatusUsecase {
  final SplashRepository splashRepository;

  CheckAppStatusUsecase(this.splashRepository);

  Future<AppStartStatus> call() async {
    return await splashRepository.checkStatus();
  }
}
