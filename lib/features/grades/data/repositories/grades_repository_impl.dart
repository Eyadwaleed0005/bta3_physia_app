import 'package:bta3_physia/core/errors/error_model/app_error_model.dart';
import 'package:bta3_physia/core/errors/handlers/firebase_error_handler.dart';
import 'package:cloud_firestore/cloud_firestore.dart' show FirebaseException;
import 'package:dartz/dartz.dart';

import '../../domain/entities/grade_entity.dart';
import '../../domain/repositories/grades_repository.dart';
import '../data_sources/grades_remote_data_source.dart';

class GradesRepositoryImpl implements GradesRepository {
  const GradesRepositoryImpl({required this._remoteDataSource});

  final GradesRemoteDataSource _remoteDataSource;

  @override
  Future<Either<AppErrorModel, List<GradeEntity>>> getGrades() async {
    try {
      final grades = await _remoteDataSource.getGrades();
      return Right(grades);
    } on FirebaseException catch (error) {
      return Left(FirebaseErrorHandler.handleFirestore(error.code));
    }
  }

  @override
  Stream<Either<AppErrorModel, List<GradeEntity>>> streamGrades() async* {
    try {
      await for (final grades in _remoteDataSource.streamGrades()) {
        yield Right(grades);
      }
    } on FirebaseException catch (error) {
      yield Left(FirebaseErrorHandler.handleFirestore(error.code));
    }
  }
}
