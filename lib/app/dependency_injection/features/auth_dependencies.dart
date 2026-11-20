import 'package:bta3_physia/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:bta3_physia/features/auth/presentation/cubit/register_cubit/register_cubit.dart';
import 'package:get_it/get_it.dart';

void registerAuthDependencies(GetIt getIt) {
  _registerCubits(getIt);
}

void _registerCubits(GetIt getIt) {
  getIt.registerFactory<LoginCubit>(() => LoginCubit());

  getIt.registerFactory<RegisterCubit>(() => RegisterCubit());
}
