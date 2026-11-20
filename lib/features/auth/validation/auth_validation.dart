import 'package:bta3_physia/features/auth/validation/auth_validation_handler.dart';
import 'package:bta3_physia/features/auth/validation/confirmation_handler.dart';
import 'package:bta3_physia/features/auth/validation/email_handler.dart';
import 'package:bta3_physia/features/auth/validation/full_name_handler.dart';
import 'package:bta3_physia/features/auth/validation/grade_handler.dart';
import 'package:bta3_physia/features/auth/validation/password_handler.dart';
import 'package:bta3_physia/features/auth/validation/phone_handler.dart';

abstract final class AuthValidation {
  const AuthValidation._();

  static const int minNameLength = FullNameHandler.minLength;
  static const int phoneLength = PhoneHandler.length;
  static const int minPasswordLength = PasswordHandler.minLength;

  static final AuthValidationHandler _chain = _createChain();

  static AuthValidationHandler _createChain() {
    final FullNameHandler fullNameHandler = FullNameHandler();

    fullNameHandler
        .setNext(EmailHandler())
        .setNext(PhoneHandler())
        .setNext(GradeHandler())
        .setNext(PasswordHandler())
        .setNext(ConfirmationHandler());

    return fullNameHandler;
  }

  static String? fullName(String? value) {
    return _chain.handle(
      AuthValidationRequest(
        field: AuthValidationField.fullName,
        value: value ?? '',
      ),
    );
  }

  static String? email(String? value) {
    return _chain.handle(
      AuthValidationRequest(
        field: AuthValidationField.email,
        value: value ?? '',
      ),
    );
  }

  static String? phone(String? value) {
    return _chain.handle(
      AuthValidationRequest(
        field: AuthValidationField.phone,
        value: value ?? '',
      ),
    );
  }

  static String? grade(String? gradeId) {
    return _chain.handle(
      AuthValidationRequest(
        field: AuthValidationField.grade,
        value: gradeId ?? '',
      ),
    );
  }

  static String? password(String? value) {
    return _chain.handle(
      AuthValidationRequest(
        field: AuthValidationField.password,
        value: value ?? '',
      ),
    );
  }

  static String? confirmation(String? confirmation, String? password) {
    return _chain.handle(
      AuthValidationRequest(
        field: AuthValidationField.confirmation,
        value: confirmation ?? '',
        other: password ?? '',
      ),
    );
  }
}
