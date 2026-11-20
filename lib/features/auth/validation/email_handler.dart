import 'package:bta3_physia/features/auth/validation/auth_validation_handler.dart';

class EmailHandler extends AuthValidationHandler {
  static final RegExp _emailPattern = RegExp(r'^[\w.+-]+@[\w-]+(\.[\w-]+)+$');

  @override
  String? handle(AuthValidationRequest request) {
    if (request.field != AuthValidationField.email) {
      return super.handle(request);
    }

    final String email = request.value.trim();

    if (email.isEmpty) {
      return 'بريدك الإلكتروني مطلوب';
    }

    if (!_emailPattern.hasMatch(email)) {
      return 'أدخل بريدًا إلكترونيًا صحيحًا';
    }

    return super.handle(request);
  }
}
