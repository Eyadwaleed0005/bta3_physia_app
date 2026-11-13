enum ProfileValidationField { fullName, email, password }

class ProfileValidationRequest {
  const ProfileValidationRequest({
    required this.field,
    required this.value,
    this.other,
  });

  final ProfileValidationField field;
  final String value;
  final String? other;
}

abstract class ProfileValidationHandler {
  ProfileValidationHandler? _nextHandler;

  ProfileValidationHandler setNext(ProfileValidationHandler handler) {
    _nextHandler = handler;

    return handler;
  }

  String? handle(ProfileValidationRequest request) {
    return _nextHandler?.handle(request);
  }
}
