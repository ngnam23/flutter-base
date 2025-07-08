import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final onboardingProvider = StateNotifierProvider<OnboardingController, bool>(
  (ref) => OnboardingController(),
);

class OnboardingController extends StateNotifier<bool> {
  OnboardingController() : super(false) {
    _loadStatus();
  }

  Future<void> _loadStatus() async {
    final seen = await hasSeenOnboarding();
    state = seen;
  }

  Future<void> setSeen() async {
    await setOnboardingSeen();
    state = true;
  }

  static const key = 'onboardingSeen';

  static Future<bool> hasSeenOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  static Future<void> setOnboardingSeen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, true);
  }
}
