part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();
}

final class LoginFormState extends LoginState {
  const LoginFormState({
    this.obscurePassword = true,
    this.isSubmitting = false,
    this.submissionError,
  });

  final bool obscurePassword;
  final bool isSubmitting;
  final String? submissionError;

  LoginFormState copyWith({
    bool? obscurePassword,
    bool? isSubmitting,
    String? submissionError,
    bool clearSubmissionError = false,
  }) {
    return LoginFormState(
      obscurePassword: obscurePassword ?? this.obscurePassword,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      submissionError: clearSubmissionError
          ? null
          : submissionError ?? this.submissionError,
    );
  }

  @override
  List<Object?> get props => [obscurePassword, isSubmitting, submissionError];
}

final class LoginAuthenticated extends LoginState {
  const LoginAuthenticated();

  @override
  List<Object?> get props => const [];
}
