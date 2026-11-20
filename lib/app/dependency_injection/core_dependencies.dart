import 'package:bta3_physia/core/connection/cubit/network_status_cubit.dart';
import 'package:bta3_physia/core/connection/network/internet_connection_network_info.dart';
import 'package:bta3_physia/core/connection/network/network_info.dart';
import 'package:get_it/get_it.dart';

void registerCoreDependencies(GetIt getIt) {
  _registerNetworkDependencies(getIt);
  _registerCoreCubits(getIt);
}

void _registerNetworkDependencies(GetIt getIt) {
  getIt.registerLazySingleton<NetworkInfo>(
    () => InternetConnectionNetworkInfo(),
  );
}

void _registerCoreCubits(GetIt getIt) {
  getIt.registerLazySingleton<NetworkStatusCubit>(
    () => NetworkStatusCubit(networkInfo: getIt<NetworkInfo>()),
  );
}
