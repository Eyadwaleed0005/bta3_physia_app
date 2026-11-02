import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/features/auth/presentation/cubit/register_cubit/register_cubit.dart';
import 'package:bta3_physia/features/auth/presentation/widgets/auth_widgets/auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPasswordStep extends StatelessWidget {
  const RegisterPasswordStep({
    super.key,
    required this.passwordController,
    required this.confirmationController,
  });

  final TextEditingController passwordController;
  final TextEditingController confirmationController;

  bool _shouldRebuild(RegisterState previous, RegisterState current) {
    if (current is! RegisterFormState || previous is! RegisterFormState) {
      return true;
    }

    return previous.obscurePassword != current.obscurePassword ||
        previous.obscureConfirmation != current.obscureConfirmation ||
        previous.passwordError != current.passwordError ||
        previous.confirmationError != current.confirmationError;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: _shouldRebuild,
      builder: (BuildContext context, RegisterState state) {
        final RegisterFormState form = state is RegisterFormState
            ? state
            : const RegisterFormState();
        final RegisterCubit cubit = context.read<RegisterCubit>();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AuthTextField(
              controller: passwordController,
              label: 'كلمة المرور',
              hint: 'أنشئ كلمة مرور',
              obscureText: form.obscurePassword,
              textInputAction: TextInputAction.next,
              autofillHints: const <String>[AutofillHints.newPassword],
              errorText: form.passwordError,
              onToggleObscure: cubit.togglePasswordVisibility,
              onChanged: (_) => cubit.clearErrors(),
            ),
            verticalSpace(16),
            AuthTextField(
              controller: confirmationController,
              label: 'تأكيد كلمة المرور',
              hint: 'أعد كتابة كلمة المرور',
              obscureText: form.obscureConfirmation,
              textInputAction: TextInputAction.done,
              autofillHints: const <String>[AutofillHints.newPassword],
              errorText: form.confirmationError,
              onToggleObscure: cubit.toggleConfirmationVisibility,
              onChanged: (_) => cubit.clearErrors(),
            ),
            verticalSpace(16),
            const _PasswordHint(),
          ],
        );
      },
    );
  }
}

class _PasswordHint extends StatelessWidget {
  const _PasswordHint();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: ColorPalette.fieldFill.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: ColorPalette.fieldBorder, width: 1.w),
      ),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.lock_outline_rounded,
            size: 18.r,
            color: ColorPalette.textMuted,
          ),
          horizontalSpace(8),
          Expanded(
            child: Text(
              '٦ أحرف على الأقل، ويفضّل مزج الأرقام والرموز.',
              textAlign: TextAlign.right,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.font15TextMutedRegularTajawal(),
            ),
          ),
        ],
      ),
    );
  }
}
