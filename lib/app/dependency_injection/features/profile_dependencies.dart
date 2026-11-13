import 'package:bta3_physia/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:get_it/get_it.dart';

void registerProfileDependencies(GetIt getIt) {
  _registerCubits(getIt);
}

void _registerCubits(GetIt getIt) {
  getIt.registerLazySingleton<ProfileCubit>(() => ProfileCubit());
}
