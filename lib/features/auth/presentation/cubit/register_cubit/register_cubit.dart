import 'package:bta3_physia/core/errors/error_model/app_error_model.dart';
import 'package:bta3_physia/features/auth/domain/entities/register_entity.dart';
import 'package:bta3_physia/features/auth/domain/use_cases/register_use_case.dart';
import 'package:bta3_physia/features/auth/presentation/validation/auth_validation.dart';
import 'package:bta3_physia/features/grades/domain/entities/grade_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required RegisterUseCase registerUseCase})
    : _registerUseCase = registerUseCase,
      super(const RegisterFormState());

  final RegisterUseCase _registerUseCase;

  ({String fullName, String email, String phoneNumber})? _details;

  RegisterFormState get _form => state is RegisterFormState
      ? state as RegisterFormState
      : const RegisterFormState();

  bool get canGoBack =>
      _form.step != RegisterStep.details && !_form.isSubmitting;

  bool goBack() {
    if (state is! RegisterFormState || !canGoBack) {
      return false;
    }

    emit(
      _form.copyWith(
        step: RegisterStep.values[_form.step.index - 1],
        clearSubmissionError: true,
      ),
    );

    return true;
  }

  void togglePasswordVisibility() {
    if (state is! RegisterFormState) return;

    emit(_form.copyWith(obscurePassword: !_form.obscurePassword));
  }

  void toggleConfirmationVisibility() {
    if (state is! RegisterFormState) return;

    emit(_form.copyWith(obscureConfirmation: !_form.obscureConfirmation));
  }

  void clearErrors() {
    if (state is! RegisterFormState || !_form.hasErrors) return;

    emit(_form.copyWith(clearSubmissionError: true));
  }

  void submitDetails({
    required String fullName,
    required String email,
    required String phone,
  }) {
    if (state is! RegisterFormState || _form.isSubmitting) return;

    final nameError = AuthValidation.fullName(fullName);
    final emailError = AuthValidation.email(email);
    final phoneError = AuthValidation.phone(phone);

    if (nameError != null || emailError != null || phoneError != null) {
      emit(
        _form.copyWith(
          fullNameError: nameError,
          emailError: emailError,
          phoneError: phoneError,
        ),
      );
      return;
    }

    _details = (
      fullName: fullName.trim(),
      email: email.trim(),
      phoneNumber: phone.trim(),
    );

    emit(_form.copyWith(step: RegisterStep.grade));
  }

  void selectGrade(GradeEntity grade) {
    if (state is! RegisterFormState || _form.isSubmitting) return;

    emit(_form.copyWith(grade: grade));
  }

  void submitGrade() {
    if (state is! RegisterFormState || _form.isSubmitting) return;

    final gradeError = AuthValidation.grade(_form.grade?.gradeId);

    if (gradeError != null) {
      emit(_form.copyWith(gradeError: gradeError));
      return;
    }

    emit(_form.copyWith(step: RegisterStep.password));
  }

  Future<void> submitPassword({
    required String password,
    required String confirmation,
  }) async {
    final currentState = state;
    if (currentState is! RegisterFormState ||
        currentState.isSubmitting ||
        currentState.step != RegisterStep.password) {
      return;
    }

    final details = _details;
    final grade = currentState.grade;
    if (details == null || grade == null) return;

    final passwordError = AuthValidation.password(password);
    final confirmationError = AuthValidation.confirmation(
      confirmation,
      password,
    );

    if (passwordError != null || confirmationError != null) {
      emit(
        currentState.copyWith(
          passwordError: passwordError,
          confirmationError: confirmationError,
          clearSubmissionError: true,
        ),
      );
      return;
    }

    emit(currentState.copyWith(isSubmitting: true, clearSubmissionError: true));

    final Either<AppErrorModel, Unit> result = await _registerUseCase(
      RegisterEntity(
        fullName: details.fullName,
        email: details.email,
        phoneNumber: details.phoneNumber,
        gradeId: grade.gradeId,
        password: password,
      ),
    );

    if (isClosed) return;

    result.fold<void>(
      (error) => emit(
        _form.copyWith(isSubmitting: false, submissionError: error.message),
      ),
      (_) => emit(const RegisterCompleted()),
    );
  }
}
