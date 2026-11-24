enum AuthValidationField {
  fullName,
  email,
  phone,
  grade,
  password,
  confirmation,
}

class AuthValidationRequest {
  const AuthValidationRequest({
    required this.field,
    required this.value,
    this.other,
  });

  final AuthValidationField field;
  final String value;
  final String? other;
}

abstract class AuthValidationHandler {
  AuthValidationHandler? _nextHandler;

  AuthValidationHandler setNext(AuthValidationHandler handler) {
    _nextHandler = handler;

    return handler;
  }

  String? handle(AuthValidationRequest request) {
    return _nextHandler?.handle(request);
  }
}
