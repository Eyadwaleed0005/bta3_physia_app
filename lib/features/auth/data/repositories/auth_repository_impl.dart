import 'package:bta3_physia/core/errors/error_model/app_error_model.dart';
import 'package:bta3_physia/core/errors/handlers/firebase_error_handler.dart';
import 'package:bta3_physia/features/auth/data/data_sources/login_remote_data_source/login_remote_data_source.dart';
import 'package:bta3_physia/features/auth/data/data_sources/register_remote_data_source/register_remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuthException;
import 'package:firebase_core/firebase_core.dart' show FirebaseException;

import '../../domain/entities/login_entity.dart';
import '../../domain/entities/register_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/login_request_model.dart';
import '../models/register_request_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({
    required LoginRemoteDataSource loginRemoteDataSource,
    required RegisterRemoteDataSource registerRemoteDataSource,
  }) : _loginRemoteDataSource = loginRemoteDataSource,
       _registerRemoteDataSource = registerRemoteDataSource;

  final LoginRemoteDataSource _loginRemoteDataSource;
  final RegisterRemoteDataSource _registerRemoteDataSource;

  @override
  Future<Either<AppErrorModel, Unit>> login(LoginEntity entity) async {
    final request = LoginRequestModel(
      email: entity.email,
      password: entity.password,
    );

    try {
      await _loginRemoteDataSource.login(request);
      return const Right(unit);
    } on FirebaseAuthException catch (error) {
      return Left(FirebaseErrorHandler.handleAuth(error.code));
    } on FirebaseException catch (error) {
      return Left(FirebaseErrorHandler.handleFirestore(error.code));
    }
  }

  @override
  Future<Either<AppErrorModel, Unit>> register(RegisterEntity entity) async {
    final request = RegisterRequestModel(
      fullName: entity.fullName,
      email: entity.email,
      phoneNumber: entity.phoneNumber,
      gradeId: entity.gradeId,
      password: entity.password,
    );

    try {
      await _registerRemoteDataSource.register(request);
      return const Right(unit);
    } on FirebaseAuthException catch (error) {
      return Left(FirebaseErrorHandler.handleAuth(error.code));
    } on FirebaseException catch (error) {
      return Left(FirebaseErrorHandler.handleFirestore(error.code));
    }
  }
}
