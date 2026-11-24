import 'package:bta3_physia/core/errors/handlers/firebase_error_codes.dart';
import 'package:bta3_physia/core/firebase/firestore/firestore_collections.dart';
import 'package:bta3_physia/core/firebase/firestore/firestore_fields.dart';
import 'package:bta3_physia/features/auth/data/models/register_request_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'register_remote_data_source.dart';

class FirebaseRegisterRemoteDataSource implements RegisterRemoteDataSource {
  const FirebaseRegisterRemoteDataSource({
    required FirebaseAuth auth,
    required FirebaseFirestore firestore,
  }) : _auth = auth,
       _firestore = firestore;

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  @override
  Future<void> register(RegisterRequestModel request) async {
    final email = request.email.trim();

    final credential = await _createOrSignIn(
      email: email,
      password: request.password,
    );

    try {
      final user = credential.user;
      if (user == null) {
        throw FirebaseAuthException(
          code: FirebaseErrorCodes.registrationUserMissing,
        );
      }

      final studentRef = _firestore
          .collection(FirestoreCollections.student)
          .doc(user.uid);

      final gradeRef = _firestore
          .collection(FirestoreCollections.grades)
          .doc(request.gradeId);

      await _firestore.runTransaction<void>((transaction) async {
        final student = await transaction.get(studentRef);
        if (student.exists) {
          throw FirebaseAuthException(
            code: FirebaseErrorCodes.emailAlreadyInUse,
          );
        }

        final grade = await transaction.get(gradeRef);
        if (grade.data()?[FirestoreFields.isDeleting] != false) {
          throw FirebaseAuthException(
            code: FirebaseErrorCodes.gradeUnavailable,
          );
        }

        transaction.set(studentRef, {
          FirestoreFields.name: request.fullName.trim(),
          FirestoreFields.email: email,
          FirestoreFields.phoneNumber: request.phoneNumber.trim(),
          FirestoreFields.gradeId: request.gradeId,
          FirestoreFields.loggin: false,
          FirestoreFields.isActive: true,
          FirestoreFields.createdAt: FieldValue.serverTimestamp(),
        });
      });
    } finally {
      await _auth.signOut();
    }
  }

  Future<UserCredential> _createOrSignIn({
    required String email,
    required String password,
  }) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (error) {
      if (error.code != FirebaseErrorCodes.emailAlreadyInUse) {
        rethrow;
      }

      return _auth.signInWithEmailAndPassword(email: email, password: password);
    }
  }
}
