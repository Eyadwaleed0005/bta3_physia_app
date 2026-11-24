import 'package:bta3_physia/core/errors/handlers/firebase_error_codes.dart';
import 'package:bta3_physia/core/firebase/firestore/firestore_collections.dart';
import 'package:bta3_physia/core/firebase/firestore/firestore_fields.dart';
import 'package:bta3_physia/features/auth/data/models/login_request_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login_remote_data_source.dart';

class FirebaseLoginRemoteDataSource implements LoginRemoteDataSource {
  const FirebaseLoginRemoteDataSource({
    required FirebaseAuth auth,
    required FirebaseFirestore firestore,
  }) : _auth = auth,
       _firestore = firestore;

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  @override
  Future<void> login(LoginRequestModel request) async {
    final credential = await _auth.signInWithEmailAndPassword(
      email: request.email.trim(),
      password: request.password,
    );

    var loginCompleted = false;

    try {
      final user = credential.user;
      if (user == null) {
        throw FirebaseAuthException(code: FirebaseErrorCodes.loginUserMissing);
      }

      final studentRef = _firestore
          .collection(FirestoreCollections.student)
          .doc(user.uid);

      await _firestore.runTransaction<void>((transaction) async {
        final snapshot = await transaction.get(studentRef);
        final student = snapshot.data();

        if (student == null) {
          throw FirebaseAuthException(
            code: FirebaseErrorCodes.studentProfileMissing,
          );
        }

        if (student[FirestoreFields.isActive] != true) {
          throw FirebaseAuthException(code: FirebaseErrorCodes.accountInactive);
        }

        if (student[FirestoreFields.loggin] != false) {
          throw FirebaseAuthException(code: FirebaseErrorCodes.alreadyLoggedIn);
        }

        transaction.update(studentRef, {FirestoreFields.loggin: true});
      });

      loginCompleted = true;
    } finally {
      if (!loginCompleted) {
        await _auth.signOut();
      }
    }
  }
}
