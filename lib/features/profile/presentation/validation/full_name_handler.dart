import 'package:bta3_physia/features/profile/presentation/validation/profile_validation_handler.dart';

class FullNameHandler extends ProfileValidationHandler {
  static const int minLength = 3;

  @override
  String? handle(ProfileValidationRequest request) {
    if (request.field != ProfileValidationField.fullName) {
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
