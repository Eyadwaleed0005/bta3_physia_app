import 'package:bta3_physia/core/errors/error_model/app_error_model.dart';
import 'package:dartz/dartz.dart';

import '../entities/grade_entity.dart';
import '../repositories/grades_repository.dart';

class GetGradesUseCase {
  const GetGradesUseCase({required GradesRepository gradesRepository})
    : _gradesRepository = gradesRepository;

  final GradesRepository _gradesRepository;

  Future<Either<AppErrorModel, List<GradeEntity>>> call() {
    return _gradesRepository.getGrades();
  }
}
