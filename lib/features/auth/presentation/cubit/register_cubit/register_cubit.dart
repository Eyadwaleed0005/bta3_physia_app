import 'package:bta3_physia/features/auth/model/grade_option.dart';
import 'package:bta3_physia/features/auth/validation/auth_validation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterFormState());

  RegisterFormState get _form => state is RegisterFormState
      ? state as RegisterFormState
      : const RegisterFormState();

  bool get canGoBack =>
      _form.step != RegisterStep.details && !_form.isSubmitting;

  bool goBack() {
    if (state is! RegisterFormState || !canGoBack) {
      return false;
    }

    emit(_form.copyWith(step: RegisterStep.values[_form.step.index - 1]));

    return true;
  }

  void togglePasswordVisibility() {
    if (state is! RegisterFormState) {
      return;
    }

    emit(_form.copyWith(obscurePassword: !_form.obscurePassword));
  }

  void toggleConfirmationVisibility() {
    if (state is! RegisterFormState) {
      return;
    }

    emit(_form.copyWith(obscureConfirmation: !_form.obscureConfirmation));
  }

  void clearErrors() {
    if (state is! RegisterFormState || !_form.hasErrors) {
      return;
    }

    emit(_form.copyWith());
  }

  void submitDetails({
    required String fullName,
    required String email,
    required String phone,
  }) {
    if (state is! RegisterFormState || _form.isSubmitting) {
      return;
    }

    final String? nameError = AuthValidation.fullName(fullName);
    final String? emailError = AuthValidation.email(email);
    final String? phoneError = AuthValidation.phone(phone);

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

    emit(_form.copyWith(step: RegisterStep.grade));
  }

  void selectGrade(GradeOption grade) {
    if (state is! RegisterFormState || _form.isSubmitting) {
      return;
    }

    emit(_form.copyWith(grade: grade));
  }

  void submitGrade() {
    if (state is! RegisterFormState || _form.isSubmitting) {
      return;
    }

    final String? gradeError = AuthValidation.grade(_form.grade?.id);

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
    if (state is! RegisterFormState || _form.isSubmitting) {
      return;
    }

    final String? passwordError = AuthValidation.password(password);
    final String? confirmationError = AuthValidation.confirmation(
      confirmation,
      password,
    );

    if (passwordError != null || confirmationError != null) {
      emit(
        _form.copyWith(
          passwordError: passwordError,
          confirmationError: confirmationError,
        ),
      );

      return;
    }

    emit(_form.copyWith(isSubmitting: true));

    await Future<void>.delayed(const Duration(milliseconds: 600));

    if (isClosed) {
      return;
    }

    emit(const RegisterCompleted());
  }
}
