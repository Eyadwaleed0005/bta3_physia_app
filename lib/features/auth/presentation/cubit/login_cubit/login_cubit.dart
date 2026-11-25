import 'package:bta3_physia/core/errors/error_model/app_error_model.dart';
import 'package:bta3_physia/features/auth/domain/entities/login_entity.dart';
import 'package:bta3_physia/features/auth/domain/use_cases/login_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required LoginUseCase loginUseCase})
    : _loginUseCase = loginUseCase,
      super(const LoginFormState());

  final LoginUseCase _loginUseCase;

  void togglePasswordVisibility() {
    final currentState = state;
    if (currentState is! LoginFormState) return;

    emit(currentState.copyWith(obscurePassword: !currentState.obscurePassword));
  }

  Future<void> submit({required String email, required String password}) async {
    final currentState = state;
    if (currentState is! LoginFormState || currentState.isSubmitting) return;

    emit(currentState.copyWith(isSubmitting: true, clearSubmissionError: true));

    final Either<AppErrorModel, Unit> result = await _loginUseCase(
      LoginEntity(email: email.trim(), password: password),
    );

    if (isClosed) return;

    final updatedState = state;
    if (updatedState is! LoginFormState) return;

    result.fold<void>(
      (error) => emit(
        updatedState.copyWith(
          isSubmitting: false,
          submissionError: error.message,
        ),
      ),
      (_) => emit(const LoginAuthenticated()),
    );
  }
}
