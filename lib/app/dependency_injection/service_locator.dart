import 'package:bta3_physia/app/dependency_injection/core_dependencies.dart';
import 'package:bta3_physia/app/dependency_injection/features/auth_dependencies.dart';
import 'package:bta3_physia/app/dependency_injection/features/courses_dependencies.dart';
import 'package:bta3_physia/app/dependency_injection/features/exams_dependencies.dart';
import 'package:bta3_physia/app/dependency_injection/features/home_dependencies.dart';
import 'package:bta3_physia/app/dependency_injection/features/lesson_quiz_dependencies.dart';
import 'package:bta3_physia/app/dependency_injection/features/live_dependencies.dart';
import 'package:bta3_physia/app/dependency_injection/features/main_navigation_dependencies.dart';
import 'package:bta3_physia/app/dependency_injection/features/notifications_dependencies.dart';
import 'package:bta3_physia/app/dependency_injection/features/results_dependencies.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  registerCoreDependencies(getIt);
  registerAuthDependencies(getIt);
  registerMainNavigationDependencies(getIt);
  registerHomeDependencies(getIt);
  registerLiveDependencies(getIt);
  registerCoursesDependencies(getIt);
  registerNotificationsDependencies(getIt);
  registerExamsDependencies(getIt);
  registerResultsDependencies(getIt);
  registerLessonQuizDependencies(getIt);
}
