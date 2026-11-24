import 'package:bta3_physia/features/auth/data/data_sources/login_remote_data_source/firebase_login_remote_data_source.dart';
import 'package:bta3_physia/features/auth/data/data_sources/login_remote_data_source/login_remote_data_source.dart';
import 'package:bta3_physia/features/auth/data/data_sources/register_remote_data_source/firebase_register_remote_data_source.dart';
import 'package:bta3_physia/features/auth/data/data_sources/register_remote_data_source/register_remote_data_source.dart';
import 'package:bta3_physia/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:bta3_physia/features/auth/domain/repositories/auth_repository.dart';
import 'package:bta3_physia/features/auth/domain/use_cases/login_use_case.dart';
import 'package:bta3_physia/features/auth/domain/use_cases/register_use_case.dart';
import 'package:bta3_physia/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:bta3_physia/features/auth/presentation/cubit/register_cubit/register_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

void registerAuthDependencies(GetIt getIt) {
  getIt.registerLazySingleton<LoginRemoteDataSource>(
    () => FirebaseLoginRemoteDataSource(
      auth: FirebaseAuth.instance,
      firestore: FirebaseFirestore.instance,
    ),
  );

  getIt.registerLazySingleton<RegisterRemoteDataSource>(
    () => FirebaseRegisterRemoteDataSource(
      auth: FirebaseAuth.instance,
      firestore: FirebaseFirestore.instance,
    ),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      loginRemoteDataSource: getIt<LoginRemoteDataSource>(),
      registerRemoteDataSource: getIt<RegisterRemoteDataSource>(),
    ),
  );

  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(authRepository: getIt<AuthRepository>()),
  );

  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(authRepository: getIt<AuthRepository>()),
  );

  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(loginUseCase: getIt<LoginUseCase>()),
  );

  getIt.registerFactory<RegisterCubit>(
    () => RegisterCubit(registerUseCase: getIt<RegisterUseCase>()),
  );
}
