import '../models/grade_model.dart';

abstract interface class GradesRemoteDataSource {
  Future<List<GradeModel>> getGrades();

  Stream<List<GradeModel>> streamGrades();
}
