import 'package:bta3_physia/features/app_startup/data/data_sources/cache/onboarding_cache.dart';
import 'package:bta3_physia/features/app_startup/data/data_sources/cache/shared_preferences_onboarding_cache.dart'
    show SharedPreferencesOnboardingCache;
import 'package:bta3_physia/features/app_startup/data/repositories/onboarding_repository_impl.dart';
import 'package:bta3_physia/features/app_startup/domain/repositories/onboarding_repository.dart';
import 'package:bta3_physia/features/app_startup/domain/use_cases/complete_onboarding.dart';
import 'package:bta3_physia/features/app_startup/domain/use_cases/is_onboarding_completed.dart';
import 'package:bta3_physia/features/app_startup/presentation/cubit/app_startup_cubit.dart';
import 'package:get_it/get_it.dart';

void registerAppStartupDependencies(GetIt getIt) {
  getIt.registerLazySingleton<OnboardingCache>(
    () => const SharedPreferencesOnboardingCache(),
  );

  getIt.registerLazySingleton<OnboardingRepository>(
    () => OnboardingRepositoryImpl(getIt<OnboardingCache>()),
  );

  getIt.registerLazySingleton<IsOnboardingCompleted>(
    () => IsOnboardingCompleted(getIt<OnboardingRepository>()),
  );

  getIt.registerLazySingleton<CompleteOnboarding>(
    () => CompleteOnboarding(getIt<OnboardingRepository>()),
  );

  getIt.registerFactory<AppStartupCubit>(
    () => AppStartupCubit(
      getIt<IsOnboardingCompleted>(),
      getIt<CompleteOnboarding>(),
    ),
  );
}
