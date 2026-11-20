import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/features/auth/presentation/cubit/register_cubit/register_cubit.dart';
import 'package:bta3_physia/features/auth/presentation/widgets/auth_widgets/auth_text_field.dart';
import 'package:bta3_physia/features/auth/validation/auth_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterDetailsStep extends StatelessWidget {
  const RegisterDetailsStep({
    super.key,
    required this.fullNameController,
    required this.emailController,
    required this.phoneController,
  });

  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;

  bool _shouldRebuild(RegisterState previous, RegisterState current) {
    if (current is! RegisterFormState || previous is! RegisterFormState) {
      return true;
    }

    return previous.fullNameError != current.fullNameError ||
        previous.emailError != current.emailError ||
        previous.phoneError != current.phoneError;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: _shouldRebuild,
      builder: (BuildContext context, RegisterState state) {
        final RegisterFormState form = state is RegisterFormState
            ? state
            : const RegisterFormState();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AuthTextField(
              controller: fullNameController,
              label: 'الاسم الكامل',
              hint: 'أدخل اسمك الكامل',
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              autofillHints: const <String>[AutofillHints.name],
              errorText: form.fullNameError,
              onChanged: (_) => context.read<RegisterCubit>().clearErrors(),
            ),
            verticalSpace(16),
            AuthTextField(
              controller: emailController,
              label: 'البريد الإلكتروني',
              hint: 'أدخل بريدك الإلكتروني',
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              autofillHints: const <String>[AutofillHints.email],
              errorText: form.emailError,
              onChanged: (_) => context.read<RegisterCubit>().clearErrors(),
            ),
            verticalSpace(16),
            AuthTextField(
              controller: phoneController,
              label: 'رقم الهاتف',
              hint: 'أدخل رقم هاتفك',
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.done,
              autofillHints: const <String>[AutofillHints.telephoneNumber],
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(AuthValidation.phoneLength),
              ],
              errorText: form.phoneError,
              onChanged: (_) => context.read<RegisterCubit>().clearErrors(),
            ),
          ],
        );
      },
    );
  }
}
