import 'package:bta3_physia/features/auth/validation/auth_validation_handler.dart';

class FullNameHandler extends AuthValidationHandler {
  static const int minLength = 3;

  @override
  String? handle(AuthValidationRequest request) {
    if (request.field != AuthValidationField.fullName) {
      return super.handle(request);
    }

    final String name = request.value.trim();

    if (name.isEmpty) {
      return 'اسمك الكامل مطلوب';
    }

    if (name.length < minLength) {
      return 'الاسم قصير جدًا';
    }

    return super.handle(request);
  }
}
