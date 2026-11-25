import 'package:bta3_physia/features/grades/data/data_sources/firebase_grades_remote_data_source.dart';
import 'package:bta3_physia/features/grades/data/data_sources/grades_remote_data_source.dart';
import 'package:bta3_physia/features/grades/data/repositories/grades_repository_impl.dart';
import 'package:bta3_physia/features/grades/domain/repositories/grades_repository.dart';
import 'package:bta3_physia/features/grades/domain/use_cases/get_grades_use_case.dart';
import 'package:bta3_physia/features/grades/domain/use_cases/stream_grades_use_case.dart';
import 'package:bta3_physia/features/grades/presentation/cubit/grades_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

void registerGradesDependencies(GetIt getIt) {
  getIt.registerLazySingleton<GradesRemoteDataSource>(
    () => FirebaseGradesRemoteDataSource(firestore: FirebaseFirestore.instance),
  );

  getIt.registerLazySingleton<GradesRepository>(
    () =>
        GradesRepositoryImpl(remoteDataSource: getIt<GradesRemoteDataSource>()),
  );

  getIt.registerLazySingleton<GetGradesUseCase>(
    () => GetGradesUseCase(gradesRepository: getIt<GradesRepository>()),
  );

  getIt.registerLazySingleton<StreamGradesUseCase>(
    () => StreamGradesUseCase(gradesRepository: getIt<GradesRepository>()),
  );

  getIt.registerFactory<GradesCubit>(
    () => GradesCubit(streamGradesUseCase: getIt<StreamGradesUseCase>()),
  );
}
