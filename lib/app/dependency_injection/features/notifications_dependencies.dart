import 'package:bta3_physia/features/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:get_it/get_it.dart';

void registerNotificationsDependencies(GetIt getIt) {
  _registerCubits(getIt);
}

void _registerCubits(GetIt getIt) {
  getIt.registerFactory<NotificationsCubit>(() => NotificationsCubit());
}
