import 'package:bta3_physia/core/cache/shared_preferences/shared_preference_keys.dart';
import 'package:bta3_physia/core/cache/shared_preferences/shared_preferences.dart';

import 'onboarding_cache.dart';

class SharedPreferencesOnboardingCache implements OnboardingCache {
  const SharedPreferencesOnboardingCache();

  @override
  Future<bool> isCompleted() async {
    final completed = await SharedPreferencesHelper.getBool(
      key: SharedPreferenceKeys.hasCompletedOnboarding,
    );

    return completed ?? false;
  }

  @override
  Future<void> markCompleted() {
    return SharedPreferencesHelper.saveBool(
      key: SharedPreferenceKeys.hasCompletedOnboarding,
      value: true,
    );
  }
}
