part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();
}

final class LoginFormState extends LoginState {
  const LoginFormState({
    this.obscurePassword = true,
    this.isSubmitting = false,
  });

  final bool obscurePassword;
  final bool isSubmitting;

  LoginFormState copyWith({bool? obscurePassword, bool? isSubmitting}) {
    return LoginFormState(
      obscurePassword: obscurePassword ?? this.obscurePassword,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }

  @override
  List<Object?> get props => <Object?>[obscurePassword, isSubmitting];
}

final class LoginAuthenticated extends LoginState {
  const LoginAuthenticated();

  @override
  List<Object?> get props => const <Object?>[];
}
