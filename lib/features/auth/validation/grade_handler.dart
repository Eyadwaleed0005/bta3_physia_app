import 'package:bta3_physia/features/auth/validation/auth_validation_handler.dart';

class GradeHandler extends AuthValidationHandler {
  @override
  String? handle(AuthValidationRequest request) {
    if (request.field != AuthValidationField.grade) {
      return super.handle(request);
    }

    if (request.value.isEmpty) {
      return 'اختر صفّك الدراسي';
    }

    return super.handle(request);
  }
}
