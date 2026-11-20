import 'package:bta3_physia/features/results/presentation/cubit/results_cubit.dart';
import 'package:get_it/get_it.dart';

void registerResultsDependencies(GetIt getIt) {
  _registerCubits(getIt);
}

void _registerCubits(GetIt getIt) {
  getIt.registerFactory<ResultsCubit>(() => ResultsCubit());
}
