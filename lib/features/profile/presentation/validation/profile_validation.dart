import 'package:bta3_physia/features/profile/presentation/validation/email_handler.dart';
import 'package:bta3_physia/features/profile/presentation/validation/full_name_handler.dart';
import 'package:bta3_physia/features/profile/presentation/validation/password_handler.dart';
import 'package:bta3_physia/features/profile/presentation/validation/profile_validation_handler.dart';

abstract final class ProfileValidation {
  const ProfileValidation._();

  static const int minNameLength = FullNameHandler.minLength;
  static const int minPasswordLength = PasswordHandler.minLength;

  static final ProfileValidationHandler _chain = _createChain();

  static ProfileValidationHandler _createChain() {
    final FullNameHandler fullNameHandler = FullNameHandler();

    fullNameHandler.setNext(EmailHandler()).setNext(PasswordHandler());

    return fullNameHandler;
  }

  static String? fullName(String? value) {
    return _chain.handle(
      ProfileValidationRequest(
        field: ProfileValidationField.fullName,
        value: value ?? '',
      ),
    );
  }

  static String? email(String? value) {
    return _chain.handle(
      ProfileValidationRequest(
        field: ProfileValidationField.email,
        value: value ?? '',
      ),
    );
  }

  static String? password(String? value) {
    return _chain.handle(
      ProfileValidationRequest(
        field: ProfileValidationField.password,
        value: value ?? '',
      ),
    );
  }
}
