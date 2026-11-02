import 'package:bta3_physia/core/helper/arabic_numbers_helper.dart';
import 'package:bta3_physia/features/auth/validation/auth_validation_handler.dart';

class PasswordHandler extends AuthValidationHandler {
  static const int minLength = 6;

  @override
  String? handle(AuthValidationRequest request) {
    if (request.field != AuthValidationField.password) {
      return super.handle(request);
    }

    if (request.value.isEmpty) {
      return 'كلمة المرور مطلوبة';
    }

    if (request.value.length < minLength) {
      return 'كلمة المرور ${toArabicNumbers(minLength)} أحرف على الأقل';
    }

    return super.handle(request);
  }
}
