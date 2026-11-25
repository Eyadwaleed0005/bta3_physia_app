import 'package:bta3_physia/core/errors/handlers/firebase_error_codes.dart';
import 'package:bta3_physia/core/firebase/functions/student_profile_function_contract.dart';
import 'package:bta3_physia/features/auth/data/models/register_request_model.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'register_remote_data_source.dart';

class FirebaseRegisterRemoteDataSource implements RegisterRemoteDataSource {
  const FirebaseRegisterRemoteDataSource({
    required FirebaseAuth auth,
    required FirebaseFunctions functions,
  }) : _auth = auth,
       _functions = functions;

  final FirebaseAuth _auth;
  final FirebaseFunctions _functions;

  @override
  Future<void> register(RegisterRequestModel request) async {
    await _createOrSignIn(
      email: request.email.trim(),
      password: request.password,
    );

    var registrationCompleted = false;

    try {
      final result = await _functions
          .httpsCallable(StudentProfileFunctionContract.name)
          .call<Object?>({
            StudentProfileFunctionContract.fullName: request.fullName.trim(),
            StudentProfileFunctionContract.phoneNumber: request.phoneNumber
                .trim(),
            StudentProfileFunctionContract.gradeId: request.gradeId,
          });

      switch (result.data) {
        case {StudentProfileFunctionContract.created: true}:
          registrationCompleted = true;
        case {StudentProfileFunctionContract.created: false}:
          throw FirebaseAuthException(
            code: FirebaseErrorCodes.emailAlreadyInUse,
          );
        default:
          throw FirebaseFunctionsException(
            code: FirebaseErrorCodes.invalidStudentProfileResponse,
            message: FirebaseErrorCodes.invalidStudentProfileResponse,
          );
      }
    } finally {
      if (!registrationCompleted) {
        await _auth.signOut();
      }
    }
  }

  Future<void> _createOrSignIn({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (error) {
      if (error.code != FirebaseErrorCodes.emailAlreadyInUse) {
        rethrow;
      }

      await _auth.signInWithEmailAndPassword(email: email, password: password);
    }
  }
}
