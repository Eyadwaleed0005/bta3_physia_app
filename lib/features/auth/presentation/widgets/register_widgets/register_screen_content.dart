import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
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

    final RegisterCubit cubit = context.read<RegisterCubit>();

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
    final bool moved = context.read<RegisterCubit>().goBack();

    if (!moved) {
      // Leaving the flow from step 1 is the `Register → Login` move.
      _onSignIn();
    }
  }

  /// Figma plays the electric sweep over the register screen and reveals login,
  /// so the handover always pushes a fresh login rather than popping back onto
  /// the one the flow was entered from.
  void _onSignIn() {
    Navigator.of(context).pushNamedAndRemoveUntil(
      RouteNames.loginScreen,
      (Route<dynamic> route) {
        return false;
      },
    );
  }

  /// Called when [RegisterCompleted] fires — navigate to the success screen
  /// via the electric transition (registered in [AuthRoutes]).
  void _onCompleted() {
    Navigator.of(context).pushNamedAndRemoveUntil(
      RouteNames.registerSuccessScreen,
      (Route<dynamic> route) => false,
    );
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
    switch (step) {
      case RegisterStep.details:
        return 'إنشاء حساب جديد';
      case RegisterStep.grade:
        return 'ما صفّك الدراسي؟';
      case RegisterStep.password:
        return 'أنشئ كلمة المرور';
    }
  }

  String _subtitleFor(RegisterStep step) {
    switch (step) {
      case RegisterStep.details:
        return 'خطوتك الأولى نحو فهم الفيزياء.';
      case RegisterStep.grade:
        return 'اختر صفّك لعرض المحتوى المناسب لك.';
      case RegisterStep.password:
        return 'خطوة أخيرة لحماية حسابك.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (RegisterState previous, RegisterState current) =>
          current is RegisterCompleted,
      listener: (BuildContext context, RegisterState state) {
        _onCompleted();
      },
      child: AuthBackdrop(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: BlocBuilder<RegisterCubit, RegisterState>(
              buildWhen: (RegisterState previous, RegisterState current) =>
                  current is! RegisterCompleted,
              builder: (BuildContext context, RegisterState state) {
                final RegisterFormState form = state is RegisterFormState
                    ? state
                    : const RegisterFormState();

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
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
                          children: <Widget>[
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
