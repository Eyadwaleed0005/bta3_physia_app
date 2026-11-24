import 'package:bta3_physia/core/firebase/firestore/firestore_fields.dart';

import '../../domain/entities/grade_entity.dart';

class GradeModel extends GradeEntity {
  const GradeModel({required super.gradeId, required super.name});

  factory GradeModel.fromMap({
    required String documentId,
    required Map<String, dynamic> map,
  }) {
    return GradeModel(
      gradeId: documentId,
      name: map[FirestoreFields.name] as String,
    );
  }
}
