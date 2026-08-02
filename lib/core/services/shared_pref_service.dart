import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static const String onboardingKey = 'onboardingKey';

  Future<void> saveOnboardingStatus() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool(onboardingKey, false); // True
  }

  Future<bool> getOnboardingStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(onboardingKey) ?? false; //False
  }
}
