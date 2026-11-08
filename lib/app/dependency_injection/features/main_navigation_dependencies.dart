import 'package:bta3_physia/features/main_navigation/presentation/cubit/bottom_navigation_cubit.dart';
import 'package:get_it/get_it.dart';

void registerMainNavigationDependencies(GetIt getIt) {
  _registerCubits(getIt);
}

void _registerCubits(GetIt getIt) {
  getIt.registerLazySingleton<BottomNavigationCubit>(
    () => BottomNavigationCubit(),
  );
}
