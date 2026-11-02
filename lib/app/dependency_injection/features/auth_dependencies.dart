import 'package:bta3_physia/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:bta3_physia/features/auth/presentation/cubit/register_cubit/register_cubit.dart';
import 'package:get_it/get_it.dart';

/// Registrations owned by the auth feature.
void registerAuthDependencies(GetIt getIt) {
  _registerCubits(getIt);
}

/// Factories, not singletons: every visit to a screen gets a cubit of its own,
/// so a half-filled form never leaks into the next one.
void _registerCubits(GetIt getIt) {
  getIt.registerFactory<LoginCubit>(() => LoginCubit());

  getIt.registerFactory<RegisterCubit>(() => RegisterCubit());
}
