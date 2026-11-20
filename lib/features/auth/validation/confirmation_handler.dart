import 'package:bta3_physia/features/auth/validation/auth_validation_handler.dart';

class ConfirmationHandler extends AuthValidationHandler {
  @override
  String? handle(AuthValidationRequest request) {
    if (request.field != AuthValidationField.confirmation) {
      return super.handle(request);
    }

    if (request.value.isEmpty) {
      return 'تأكيد كلمة المرور مطلوب';
    }

    if (request.value != request.other) {
      return 'كلمتا المرور غير متطابقتين';
    }

    return super.handle(request);
  }
}
