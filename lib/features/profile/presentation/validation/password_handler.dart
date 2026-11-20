import 'package:bta3_physia/core/helper/arabic_numbers_helper.dart';
import 'package:bta3_physia/features/profile/presentation/validation/profile_validation_handler.dart';

class PasswordHandler extends ProfileValidationHandler {
  static const int minLength = 6;

  @override
  String? handle(ProfileValidationRequest request) {
    if (request.field != ProfileValidationField.password) {
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
