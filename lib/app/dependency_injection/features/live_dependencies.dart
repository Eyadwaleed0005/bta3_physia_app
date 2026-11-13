import 'package:bta3_physia/features/live/presentation/cubit/live_cubit.dart';
import 'package:get_it/get_it.dart';

void registerLiveDependencies(GetIt getIt) {
  _registerCubits(getIt);
}

void _registerCubits(GetIt getIt) {
  getIt.registerFactory<LiveCubit>(() => LiveCubit());
}
