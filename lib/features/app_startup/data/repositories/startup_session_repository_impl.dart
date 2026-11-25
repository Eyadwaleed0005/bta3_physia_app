import 'package:bta3_physia/core/errors/error_model/app_error_model.dart';
import 'package:bta3_physia/core/errors/handlers/firebase_error_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repositories/startup_session_repository.dart';

class StartupSessionRepositoryImpl implements StartupSessionRepository {
  const StartupSessionRepositoryImpl({required FirebaseAuth auth})
    : _auth = auth;

  final FirebaseAuth _auth;

  @override
  Future<Either<AppErrorModel, bool>> hasValidSession() async {
    try {
      final user = await _auth.authStateChanges().first;
      return Right(user != null);
    } on FirebaseAuthException catch (error) {
      return Left(FirebaseErrorHandler.handleAuth(error.code));
    }
  }
}
