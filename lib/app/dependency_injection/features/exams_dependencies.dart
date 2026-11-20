import 'package:bta3_physia/features/exams/presentation/cubit/exam_solve_cubit.dart';
import 'package:bta3_physia/features/exams/presentation/cubit/exams_cubit.dart';
import 'package:get_it/get_it.dart';

void registerExamsDependencies(GetIt getIt) {
  _registerCubits(getIt);
}

void _registerCubits(GetIt getIt) {
  getIt.registerFactory<ExamsCubit>(() => ExamsCubit());
  getIt.registerFactory<ExamSolveCubit>(() => ExamSolveCubit());
}
