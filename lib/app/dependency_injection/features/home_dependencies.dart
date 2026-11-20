import 'package:bta3_physia/features/home/presentation/cubit/home_cubit.dart';
import 'package:get_it/get_it.dart';

void registerHomeDependencies(GetIt getIt) {
  _registerCubits(getIt);
}

void _registerCubits(GetIt getIt) {
  getIt.registerFactory<HomeCubit>(() => HomeCubit());
}
