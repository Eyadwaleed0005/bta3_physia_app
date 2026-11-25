import 'package:bta3_physia/core/firebase/firestore/firestore_collections.dart';
import 'package:bta3_physia/core/firebase/firestore/firestore_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/grade_model.dart';
import 'grades_remote_data_source.dart';

class FirebaseGradesRemoteDataSource implements GradesRemoteDataSource {
  const FirebaseGradesRemoteDataSource({required FirebaseFirestore firestore})
    : _firestore = firestore;

  final FirebaseFirestore _firestore;

  Query<Map<String, dynamic>> get _gradesQuery => _firestore
      .collection(FirestoreCollections.grades)
      .where(FirestoreFields.isDeleting, isEqualTo: false);

  @override
  Future<List<GradeModel>> getGrades() async {
    final snapshot = await _gradesQuery.get();
    return _mapGrades(snapshot);
  }

  @override
  Stream<List<GradeModel>> streamGrades() {
    return _gradesQuery.snapshots().map(_mapGrades);
  }

  List<GradeModel> _mapGrades(QuerySnapshot<Map<String, dynamic>> snapshot) {
    return snapshot.docs.map((document) {
      return GradeModel.fromMap(documentId: document.id, map: document.data());
    }).toList();
  }
}
