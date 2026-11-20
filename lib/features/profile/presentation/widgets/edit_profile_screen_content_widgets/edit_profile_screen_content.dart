import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/core/widgets/custom_app_bar.dart';
import 'package:bta3_physia/core/widgets/custom_button.dart';
import 'package:bta3_physia/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:bta3_physia/features/profile/presentation/validation/profile_validation.dart';
import 'package:bta3_physia/features/profile/presentation/widgets/edit_profile_screen_content_widgets/edit_profile_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileScreenContent extends StatefulWidget {
  const EditProfileScreenContent({super.key});

  @override
  State<EditProfileScreenContent> createState() =>
      _EditProfileScreenContentState();
}

class _EditProfileScreenContentState extends State<EditProfileScreenContent> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    final account = context.read<ProfileCubit>().state.activeAccount;
    _nameController = TextEditingController(text: account.name);
    _emailController = TextEditingController(text: account.email);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _handleSave() {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    context.read<ProfileCubit>().prepareEditDraft(
      name: _nameController.text.trim(),
      email: _emailController.text.trim(),
    );

    Navigator.of(context).pushNamed(RouteNames.verifyIdentityScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const CustomAppBar(
            title: 'البيانات الشخصية',
            subTitle: 'عدّل بيانات الحساب الحالي',
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
                      'ترتبط اشتراكاتك ونتائجك بالحساب نفسه عند تعديل البريد الإلكتروني.',
                      textAlign: TextAlign.right,
                      style: AppTextStyle.font14TextMutedRegularTajawal(),
                    ),
                    verticalSpace(24),
                    EditProfileTextField(
                      controller: _nameController,
                      label: 'الاسم',
                      hint: 'أدخل الاسم',
                      textInputAction: TextInputAction.next,
                      autofillHints: const <String>[AutofillHints.name],
                      validator: ProfileValidation.fullName,
                    ),
                    verticalSpace(19),
                    EditProfileTextField(
                      controller: _emailController,
                      label: 'البريد الإلكتروني',
                      hint: 'أدخل البريد الإلكتروني',
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      autofillHints: const <String>[AutofillHints.email],
                      validator: ProfileValidation.email,
                    ),
                    verticalSpace(28),
                    CustomButton(
                      onPressed: _handleSave,
                      height: 48.h,
                      background: ColorPalette.accent,
                      foreground: ColorPalette.textPrimary,
                      borderRadius: 24.r,
                      text: 'حفظ التغييرات',
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
