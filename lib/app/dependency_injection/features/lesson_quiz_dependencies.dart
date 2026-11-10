import 'package:bta3_physia/features/lesson_quiz/presentation/cubit/lesson_quiz_cubit.dart';
import 'package:bta3_physia/features/lesson_quiz/presentation/cubit/lesson_quiz_results_cubit.dart';
import 'package:get_it/get_it.dart';

void registerLessonQuizDependencies(GetIt getIt) {
  _registerCubits(getIt);
}

void _registerCubits(GetIt getIt) {
  getIt.registerFactory<LessonQuizCubit>(() => LessonQuizCubit());
  getIt.registerFactory<LessonQuizResultsCubit>(() => LessonQuizResultsCubit());
}
