import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.obscureText = false,
    this.onToggleObscure,
    this.errorText,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.autofillHints,
    this.enabled = true,
  });

  final TextEditingController controller;
  final String label;
  final String hint;

  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;

  final bool obscureText;

  final VoidCallback? onToggleObscure;

  final String? errorText;

  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final Iterable<String>? autofillHints;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          label,
          textAlign: TextAlign.right,
          style: AppTextStyle.font16TextLightBoldTajawal().copyWith(
            height: 1.5,
          ),
        ),
        verticalSpace(8),
        CustomTextFormField(
          controller: controller,
          hintText: hint,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          inputFormatters: inputFormatters,
          obscureText: obscureText,
          enabled: enabled,
          errorText: errorText,
          validator: validator,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          autofillHints: autofillHints,
          showPasswordCopyIcon: false,
          suffixIcon: onToggleObscure == null
              ? null
              : Icon(
                  obscureText
                      ? Icons.visibility_off_rounded
                      : Icons.visibility_rounded,
                  size: 20.r,
                  color: ColorPalette.textMuted,
                ),
          onSuffixTap: onToggleObscure,
          fillColor: ColorPalette.fieldFill,
          borderColor: ColorPalette.fieldBorder,
          focusedBorderColor: ColorPalette.accent,
          borderRadius: 16,
          cursorColor: ColorPalette.accent,
          textStyle: AppTextStyle.font18TextLightRegularTajawal(),
          hintStyle: AppTextStyle.font18TextMutedRegularTajawal(),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 14.h,
          ),
        ),
      ],
    );
  }
}
