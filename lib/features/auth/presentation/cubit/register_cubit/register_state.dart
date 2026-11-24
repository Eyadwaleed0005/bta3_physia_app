part of 'register_cubit.dart';

enum RegisterStep { details, grade, password }

sealed class RegisterState extends Equatable {
  const RegisterState();
}

final class RegisterFormState extends RegisterState {
  const RegisterFormState({
    this.step = RegisterStep.details,
    this.grade,
    this.obscurePassword = true,
    this.obscureConfirmation = true,
    this.isSubmitting = false,
    this.fullNameError,
    this.emailError,
    this.phoneError,
    this.gradeError,
    this.passwordError,
    this.confirmationError,
    this.submissionError,
  });

  final RegisterStep step;
  final GradeEntity? grade;

  final bool obscurePassword;
  final bool obscureConfirmation;
  final bool isSubmitting;

  final String? fullNameError;
  final String? emailError;
  final String? phoneError;
  final String? gradeError;
  final String? passwordError;
  final String? confirmationError;
  final String? submissionError;

  int get stepNumber => step.index + 1;

  int get totalSteps => RegisterStep.values.length;

  bool get hasErrors =>
      fullNameError != null ||
      emailError != null ||
      phoneError != null ||
      gradeError != null ||
      passwordError != null ||
      confirmationError != null ||
      submissionError != null;

  RegisterFormState copyWith({
    RegisterStep? step,
    GradeEntity? grade,
    bool? obscurePassword,
    bool? obscureConfirmation,
    bool? isSubmitting,
    String? fullNameError,
    String? emailError,
    String? phoneError,
    String? gradeError,
    String? passwordError,
    String? confirmationError,
    String? submissionError,
    bool clearSubmissionError = false,
  }) {
    return RegisterFormState(
      step: step ?? this.step,
      grade: grade ?? this.grade,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      obscureConfirmation: obscureConfirmation ?? this.obscureConfirmation,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      fullNameError: fullNameError,
      emailError: emailError,
      phoneError: phoneError,
      gradeError: gradeError,
      passwordError: passwordError,
      confirmationError: confirmationError,
      submissionError: clearSubmissionError
          ? null
          : submissionError ?? this.submissionError,
    );
  }

  @override
  List<Object?> get props => [
    step,
    grade,
    obscurePassword,
    obscureConfirmation,
    isSubmitting,
    fullNameError,
    emailError,
    phoneError,
    gradeError,
    passwordError,
    confirmationError,
    submissionError,
  ];
}

final class RegisterCompleted extends RegisterState {
  const RegisterCompleted();

  @override
  List<Object?> get props => const [];
}
