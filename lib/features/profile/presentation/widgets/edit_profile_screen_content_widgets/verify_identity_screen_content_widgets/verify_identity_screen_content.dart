import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/core/widgets/custom_app_bar.dart';
import 'package:bta3_physia/core/widgets/custom_button.dart';
import 'package:bta3_physia/features/auth/validation/auth_validation.dart';
import 'package:bta3_physia/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:bta3_physia/features/profile/presentation/widgets/edit_profile_screen_content_widgets/edit_profile_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyIdentityScreenContent extends StatefulWidget {
  const VerifyIdentityScreenContent({super.key});

  @override
  State<VerifyIdentityScreenContent> createState() =>
      _VerifyIdentityScreenContentState();
}

class _VerifyIdentityScreenContentState
    extends State<VerifyIdentityScreenContent> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _passwordController;

  bool _obscurePassword = true;

  void _togglePasswordVisibility() {
    setState(() => _obscurePassword = !_obscurePassword);
  }

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _handleConfirm() {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    context.read<ProfileCubit>().saveProfile();

    Navigator.of(context).popUntil(
      (route) =>
          route.settings.name == RouteNames.mainNavigationScreen ||
          route.isFirst,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ProfileCubit cubit = context.read<ProfileCubit>();
    final String email = cubit.state.draftEmailOrActive;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const CustomAppBar(
            title: 'تأكيد الهوية',
            subTitle: 'لحماية بيانات حسابك',
          ),
          verticalSpace(16),
          Expanded(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'أكد كلمة المرور لحفظ البريد الجديد',
                      textAlign: TextAlign.right,
                      style: AppTextStyle.font14TextMutedRegularTajawal(),
                    ),
                    verticalSpace(16),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 14.h,
                      ),
                      decoration: BoxDecoration(
                        color: ColorPalette.panelGlass,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.lock_outline_rounded,
                            size: 48.r,
                            color: ColorPalette.corona,
                          ),
                          verticalSpace(12),
                          Text(
                            'أكّد كلمة المرور لحفظ البريد الجديد',
                            style: AppTextStyle.font18TextLightBoldTajawal(),
                          ),
                          verticalSpace(12),
                          Text(
                            email,
                            style: AppTextStyle.font13TextMutedRegularTajawal(),
                          ),
                          verticalSpace(20),
                        ],
                      ),
                    ),
                    verticalSpace(16),
                    EditProfileTextField(
                      controller: _passwordController,
                      label: 'كلمة المرور',
                      hint: 'أدخل كلمة المرور',
                      obscureText: _obscurePassword,
                      textInputAction: TextInputAction.done,
                      autofillHints: const <String>[AutofillHints.password],
                      validator: AuthValidation.password,
                      onToggleObscure: _togglePasswordVisibility,
                    ),
                    verticalSpace(28),
                    CustomButton(
                      onPressed: _handleConfirm,
                      height: 48.h,
                      background: ColorPalette.accent,
                      foreground: ColorPalette.textPrimary,
                      borderRadius: 24.r,
                      text: 'تأكيد وحفظ',
                      textStyle: AppTextStyle.font16TextPrimaryBoldTajawal(),
                    ),
                    verticalSpace(8),
                    Center(
                      child: TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(
                          'إلغاء',
                          style: AppTextStyle.font14TextSecondaryBoldTajawal(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
