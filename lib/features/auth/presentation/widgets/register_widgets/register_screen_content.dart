import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/widgets/custom_operation_result_dialog.dart';
import 'package:bta3_physia/features/auth/presentation/cubit/register_cubit/register_cubit.dart';
import 'package:bta3_physia/features/auth/presentation/widgets/auth_widgets/auth_backdrop.dart';
import 'package:bta3_physia/features/auth/presentation/widgets/auth_widgets/auth_message.dart';
import 'package:bta3_physia/features/auth/presentation/widgets/auth_widgets/auth_step_progress.dart';
import 'package:bta3_physia/features/auth/presentation/widgets/register_widgets/header.dart';
import 'package:bta3_physia/features/auth/presentation/widgets/register_widgets/register_actions.dart';
import 'package:bta3_physia/features/auth/presentation/widgets/register_widgets/register_details_step.dart';
import 'package:bta3_physia/features/auth/presentation/widgets/register_widgets/register_grade_step.dart';
import 'package:bta3_physia/features/auth/presentation/widgets/register_widgets/register_password_step.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreenContent extends StatefulWidget {
  const RegisterScreenContent({super.key});

  @override
  State<RegisterScreenContent> createState() => _RegisterScreenContentState();
}

class _RegisterScreenContentState extends State<RegisterScreenContent> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmationController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmationController.dispose();
    super.dispose();
  }

  void _onPrimary(RegisterStep step) {
    FocusScope.of(context).unfocus();
    final cubit = context.read<RegisterCubit>();

    switch (step) {
      case RegisterStep.details:
        cubit.submitDetails(
          fullName: _fullNameController.text,
          email: _emailController.text,
          phone: _phoneController.text,
        );
      case RegisterStep.grade:
        cubit.submitGrade();
      case RegisterStep.password:
        cubit.submitPassword(
          password: _passwordController.text,
          confirmation: _confirmationController.text,
        );
    }
  }

  void _onBack() {
    final cubit = context.read<RegisterCubit>();
    final state = cubit.state;

    if (state is! RegisterFormState || state.isSubmitting) return;

    if (!cubit.goBack()) {
      _onSignIn();
    }
  }

  void _onSignIn() {
    final state = context.read<RegisterCubit>().state;

    if (state is! RegisterFormState || state.isSubmitting) return;

    Navigator.of(context)
        .pushNamedAndRemoveUntil(RouteNames.loginScreen, (_) => false);
  }

  void _onCompleted() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(RouteNames.mainNavigationScreen, (_) => false);
  }

  bool _shouldListen(RegisterState previous, RegisterState current) {
    return current is RegisterCompleted ||
        (previous is RegisterFormState &&
            previous.isSubmitting &&
            current is RegisterFormState &&
            !current.isSubmitting &&
            current.submissionError != null);
  }

  void _onRegisterState(BuildContext context, RegisterState state) {
    if (state is RegisterCompleted) {
      _onCompleted();
      return;
    }

    if (state case RegisterFormState(submissionError: final String message)) {
      showDialog<void>(
        context: context,
        builder: (_) => CustomOperationResultDialog(
          type: CustomOperationResultType.failure,
          title: 'تعذّر إنشاء الحساب',
          message: message,
          actionText: 'حسنًا',
        ),
      );
    }
  }

  String _primaryLabel(RegisterStep step) {
    return step == RegisterStep.password ? 'إنشاء الحساب' : 'متابعة';
  }

  Widget _buildStep(RegisterStep step) {
    switch (step) {
      case RegisterStep.details:
        return RegisterDetailsStep(
          fullNameController: _fullNameController,
          emailController: _emailController,
          phoneController: _phoneController,
        );
      case RegisterStep.grade:
        return const RegisterGradeStep();
      case RegisterStep.password:
        return RegisterPasswordStep(
          passwordController: _passwordController,
          confirmationController: _confirmationController,
        );
    }
  }

  String _titleFor(RegisterStep step) {
    return switch (step) {
      RegisterStep.details => 'إنشاء حساب جديد',
      RegisterStep.grade => 'ما صفّك الدراسي؟',
      RegisterStep.password => 'أنشئ كلمة المرور',
    };
  }

  String _subtitleFor(RegisterStep step) {
    return switch (step) {
      RegisterStep.details => 'خطوتك الأولى نحو فهم الفيزياء.',
      RegisterStep.grade => 'اختر صفّك لعرض المحتوى المناسب لك.',
      RegisterStep.password => 'خطوة أخيرة لحماية حسابك.',
    };
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: _shouldListen,
      listener: _onRegisterState,
      child: AuthBackdrop(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: BlocBuilder<RegisterCubit, RegisterState>(
              buildWhen: (_, current) => current is RegisterFormState,
              builder: (context, state) {
                final form = state is RegisterFormState
                    ? state
                    : const RegisterFormState();

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    verticalSpace(17),
                    Header(onBack: _onBack),
                    verticalSpace(26),
                    AuthStepProgress(
                      step: form.stepNumber,
                      total: form.totalSteps,
                    ),
                    verticalSpace(33),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            AuthMessage(
                              title: _titleFor(form.step),
                              subtitle: _subtitleFor(form.step),
                            ),
                            verticalSpace(33),
                            KeyedSubtree(
                              key: ValueKey<RegisterStep>(form.step),
                              child: _buildStep(form.step),
                            ),
                          ],
                        ),
                      ),
                    ),
                    verticalSpace(24),
                    RegisterActions(
                      label: _primaryLabel(form.step),
                      onPressed: () => _onPrimary(form.step),
                      onSignIn: _onSignIn,
                      isLoading: form.isSubmitting,
                    ),
                    verticalSpace(18),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
