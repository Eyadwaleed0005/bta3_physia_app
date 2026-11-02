import 'package:bta3_physia/app/dependency_injection/core_dependencies.dart';
import 'package:bta3_physia/app/dependency_injection/features/auth_dependencies.dart';
import 'package:get_it/get_it.dart';

/// The app's single service locator.
///
/// Screens never reach for it directly: routes build their cubit from [getIt]
/// and hand it to the screen through a `BlocProvider`.
final GetIt getIt = GetIt.instance;

/// Registers everything the app needs before the first screen is built.
///
/// Called once from the app initializer; keep the per-feature registrations in
/// their own file so this stays a table of contents.
void setupServiceLocator() {
  registerCoreDependencies(getIt);
  registerAuthDependencies(getIt);
}
