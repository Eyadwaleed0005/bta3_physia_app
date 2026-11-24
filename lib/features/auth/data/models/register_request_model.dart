class RegisterRequestModel {
  const RegisterRequestModel({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.gradeId,
    required this.password,
  });

  final String fullName;
  final String email;
  final String phoneNumber;
  final String gradeId;
  final String password;
}
