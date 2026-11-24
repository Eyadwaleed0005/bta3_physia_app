import 'package:bta3_physia/core/errors/error_model/app_error_model.dart';
import 'package:dartz/dartz.dart';

import '../entities/grade_entity.dart';

abstract interface class GradesRepository {
  Future<Either<AppErrorModel, List<GradeEntity>>> getGrades();

  Stream<Either<AppErrorModel, List<GradeEntity>>> streamGrades();
}
