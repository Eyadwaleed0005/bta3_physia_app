import 'package:bta3_physia/core/helper/arabic_numbers_helper.dart';
import 'package:bta3_physia/features/auth/validation/auth_validation_handler.dart';

class PhoneHandler extends AuthValidationHandler {
  static const int length = 11;

  static final RegExp _phonePattern = RegExp(r'^01\d{9}$');

  @override
  String? handle(AuthValidationRequest request) {
    if (request.field != AuthValidationField.phone) {
      return super.handle(request);
    }

    final String phone = request.value.trim();

    if (phone.isEmpty) {
      return 'رقم هاتفك مطلوب';
    }

    if (!_phonePattern.hasMatch(phone)) {
      return 'أدخل رقم هاتف صحيح (${toArabicNumbers(length)} رقمًا يبدأ بـ ٠١)';
    }

    return super.handle(request);
  }
}
