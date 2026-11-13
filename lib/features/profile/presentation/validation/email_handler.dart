import 'package:bta3_physia/features/profile/presentation/validation/profile_validation_handler.dart';

class EmailHandler extends ProfileValidationHandler {
  static final RegExp _emailPattern = RegExp(r'^[\w.+-]+@[\w-]+(\.[\w-]+)+$');

  @override
  String? handle(ProfileValidationRequest request) {
    if (request.field != ProfileValidationField.email) {
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
