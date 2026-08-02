import 'package:e_nova/core/services/firebase_service.dart';
import 'package:e_nova/core/services/shared_pref_service.dart';

abstract interface class SplashLocalDataSource {
  Future<bool> isOnboardingCompleted();
  Future<bool> isLoggedIn();
}

class SplashLocalDataSourceImpl implements SplashLocalDataSource {
  final FirebaseService firebaseService;
  final SharedPrefService prefService;

  SplashLocalDataSourceImpl(this.firebaseService, this.prefService);

  @override
  Future<bool> isLoggedIn() async {
    return firebaseService.auth.currentUser != null;
  }

  @override
  Future<bool> isOnboardingCompleted() {
    return prefService.getOnboardingStatus();
  }
}
