import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:bta3_physia/features/auth/presentation/widgets/auth_widgets/auth_primary_button.dart';
import 'package:bta3_physia/features/auth/presentation/widgets/auth_widgets/auth_text_field.dart';
import 'package:bta3_physia/features/auth/validation/auth_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    FocusScope.of(context).unfocus();

    context.read<LoginCubit>().submit(
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  bool _shouldRebuild(LoginState previous, LoginState current) {
    if (current is! LoginFormState) {
      return false;
    }

    if (previous is! LoginFormState) {
      return true;
    }

    return previous.obscurePassword != current.obscurePassword ||
        previous.isSubmitting != current.isSubmitting;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: _shouldRebuild,
      builder: (BuildContext context, LoginState state) {
        final LoginFormState form = state is LoginFormState
            ? state
            : const LoginFormState();

        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              AuthTextField(
                controller: _emailController,
                label: 'البريد الإلكتروني',
                hint: 'أدخل بريدك الإلكتروني',
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                autofillHints: const <String>[AutofillHints.email],
                validator: AuthValidation.email,
              ),
              verticalSpace(19),
              AuthTextField(
                controller: _passwordController,
                label: 'كلمة المرور',
                hint: 'أدخل كلمة المرور',
                obscureText: form.obscurePassword,
                textInputAction: TextInputAction.done,
                autofillHints: const <String>[AutofillHints.password],
                validator: AuthValidation.password,
                onToggleObscure: context
                    .read<LoginCubit>()
                    .togglePasswordVisibility,
                onSubmitted: (_) => _submit(),
              ),
              verticalSpace(66),
              AuthPrimaryButton(
                label: 'تسجيل الدخول',
                onPressed: _submit,
                isLoading: form.isSubmitting,
              ),
            ],
          ),
        );
      },
    );
  }
}
