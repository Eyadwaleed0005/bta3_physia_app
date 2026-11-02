import 'package:bta3_physia/app/dependency_injection/core_dependencies.dart';
import 'package:bta3_physia/app/dependency_injection/features/auth_dependencies.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  registerCoreDependencies(getIt);
  registerAuthDependencies(getIt);
}
