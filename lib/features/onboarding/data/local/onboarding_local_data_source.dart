import 'package:e_nova/core/services/shared_pref_service.dart';
import 'package:e_nova/core/services/firebase_service.dart';

abstract interface class OnboardingLocalDataSource {
  Future<bool> isOnboardingCompleated();
  Future<bool> isLoggedIn();
}

class OnboardingLocalDataSourceImpl implements OnboardingLocalDataSource {
  final FirebaseService firebaseService;
  final SharedPrefService sharedPrefService;

  OnboardingLocalDataSourceImpl(this.firebaseService, this.sharedPrefService);
  @override
  Future<bool> isLoggedIn() async {
    // ignore: await_only_futures
    return await firebaseService.auth.currentUser != null;
  }

  @override
  Future<bool> isOnboardingCompleated() async {
    return await sharedPrefService.getOnboardingStatus();
  }
}
