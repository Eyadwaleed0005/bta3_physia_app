import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginFormState());

  LoginFormState get _form => state is LoginFormState
      ? state as LoginFormState
      : const LoginFormState();

  void togglePasswordVisibility() {
    if (state is! LoginFormState) {
      return;
    }

    emit(_form.copyWith(obscurePassword: !_form.obscurePassword));
  }

  Future<void> submit({required String email, required String password}) async {
    if (state is! LoginFormState || _form.isSubmitting) {
      return;
    }

    emit(_form.copyWith(isSubmitting: true));

    await Future<void>.delayed(const Duration(milliseconds: 600));

    if (isClosed) {
      return;
    }

    emit(const LoginAuthenticated());
  }
}
