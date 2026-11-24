import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_animations.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/core/widgets/app_toast.dart';
import 'package:bta3_physia/core/widgets/custom_button.dart';
import 'package:bta3_physia/core/widgets/custom_secondary_button.dart';
import 'package:bta3_physia/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum CustomOperationResultType { success, failure }

class CustomOperationResultDialog extends StatefulWidget {
  const CustomOperationResultDialog({
    super.key,
    required this.type,
    required this.title,
    required this.message,
    required this.actionText,
    this.secondaryActionText,
    this.onActionPressed,
    this.onSecondaryActionPressed,
    this.email,
    this.password,
    this.successIcon = Icons.check_circle_outline_rounded,
    this.failureIcon = Icons.error_outline_rounded,
  });

  final CustomOperationResultType type;
  final String title;
  final String message;
  final String actionText;
  final String? secondaryActionText;
  final String? email;
  final String? password;
  final VoidCallback? onActionPressed;
  final VoidCallback? onSecondaryActionPressed;
  final IconData successIcon;
  final IconData failureIcon;

  @override
  State<CustomOperationResultDialog> createState() =>
      _CustomOperationResultDialogState();
}

class _CustomOperationResultDialogState
    extends State<CustomOperationResultDialog> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  bool get isSuccess => widget.type == CustomOperationResultType.success;

  bool get hasEmail => isSuccess && _emailController.text.isNotEmpty;

  bool get hasPassword => isSuccess && _passwordController.text.isNotEmpty;

  bool get hasCredentials => hasEmail || hasPassword;

  bool get hasSecondaryAction =>
      widget.secondaryActionText?.trim().isNotEmpty ?? false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: widget.email?.trim() ?? '');
    _passwordController = TextEditingController(text: widget.password ?? '');
  }

  Future<void> _copyEmail() async {
    if (!hasEmail) return;

    await _copy(
      text: _emailController.text,
      message: 'تم نسخ البريد الإلكتروني',
      icon: Icons.copy_rounded,
    );
  }

  Future<void> _copyPassword() async {
    if (!hasPassword) return;

    await _copy(
      text: _passwordController.text,
      message: 'تم نسخ كلمة المرور',
      icon: Icons.copy_rounded,
    );
  }

  Future<void> _copyCredentials() async {
    if (!hasCredentials) return;

    final values = [
      if (hasEmail) 'البريد الإلكتروني: ${_emailController.text}',
      if (hasPassword) 'كلمة المرور: ${_passwordController.text}',
    ];

    await _copy(
      text: values.join('\n'),
      message: hasPassword
          ? 'تم نسخ بيانات تسجيل الدخول'
          : 'تم نسخ البريد الإلكتروني',
      icon: Icons.copy_all_rounded,
    );
  }

  Future<void> _copy({
    required String text,
    required String message,
    required IconData icon,
  }) async {
    await Clipboard.setData(ClipboardData(text: text));
    if (!mounted) return;

    showAppToast(context, message: message, icon: icon);
  }

  void _handlePrimaryAction() {
    final action = widget.onActionPressed;
    if (action != null) {
      action();
      return;
    }

    Navigator.of(context).pop();
  }

  void _handleSecondaryAction() {
    final action = widget.onSecondaryActionPressed;
    if (action != null) {
      action();
      return;
    }

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = isSuccess
        ? ColorPalette.success
        : ColorPalette.crimsonHover;
    final icon = isSuccess ? widget.successIcon : widget.failureIcon;

    return AppAnimations.operationDialogEntrance(
      child: Dialog(
        elevation: 0,
        insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
        backgroundColor: Colors.transparent,
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            constraints: isSuccess ? null : BoxConstraints(maxWidth: 360.w),
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
              vertical: isSuccess ? 32.h : 24.h,
            ),
            decoration: BoxDecoration(
              color: isSuccess ? ColorPalette.surface : ColorPalette.fieldFill,
              borderRadius: BorderRadius.circular(isSuccess ? 28.r : 24.r),
              border: Border.all(
                color: isSuccess
                    ? statusColor.withValues(alpha: 0.30)
                    : ColorPalette.fieldBorder,
                width: isSuccess ? 1.2.w : 1.w,
              ),
              boxShadow: [
                if (isSuccess)
                  BoxShadow(
                    color: statusColor.withValues(alpha: 0.12),
                    blurRadius: 28.r,
                    offset: Offset(0, 10.h),
                  ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: isSuccess ? 72.w : 56.r,
                  height: isSuccess ? 72.w : 56.r,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: statusColor.withValues(
                      alpha: isSuccess ? 0.10 : 0.12,
                    ),
                    shape: isSuccess ? BoxShape.circle : BoxShape.rectangle,
                    borderRadius: isSuccess
                        ? null
                        : BorderRadius.circular(16.r),
                  ),
                  child: Icon(
                    icon,
                    size: isSuccess ? 38.sp : 28.r,
                    color: statusColor,
                  ),
                ),
                verticalSpace(isSuccess ? 22 : 16),
                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: isSuccess
                      ? AppTextStyle.font18TextPrimarySemiBoldKufam()
                      : AppTextStyle.font19TextLightSemiBoldKufam(),
                ),
                verticalSpace(isSuccess ? 10 : 8),
                Text(
                  widget.message,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: isSuccess
                      ? AppTextStyle.font14TextPrimaryBoldTajawal()
                      : AppTextStyle.font15TextMutedRegularTajawal().copyWith(
                          height: 1.5,
                        ),
                ),
                if (hasCredentials) ...[
                  verticalSpace(24),
                  if (hasEmail)
                    CustomTextFormField(
                      controller: _emailController,
                      labelText: 'البريد الإلكتروني',
                      hintText: 'البريد الإلكتروني',
                      readOnly: true,
                      textDirection: TextDirection.ltr,
                      suffixIcon: Icon(
                        Icons.copy_rounded,
                        color: ColorPalette.primary,
                        size: 22.sp,
                      ),
                      onSuffixTap: _copyEmail,
                    ),
                  if (hasEmail && hasPassword) verticalSpace(12),
                  if (hasPassword)
                    CustomTextFormField(
                      controller: _passwordController,
                      labelText: 'كلمة المرور',
                      hintText: 'كلمة المرور',
                      readOnly: true,
                      isPassword: true,
                      textDirection: TextDirection.ltr,
                      suffixIcon: Icon(
                        Icons.copy_rounded,
                        color: ColorPalette.primary,
                        size: 22.sp,
                      ),
                      onSuffixTap: _copyPassword,
                    ),
                  verticalSpace(16),
                  CustomSecondaryButton(
                    text: hasPassword
                        ? 'نسخ بيانات الدخول'
                        : 'نسخ البريد الإلكتروني',
                    icon: Icons.copy_all_rounded,
                    onPressed: _copyCredentials,
                  ),
                ],
                verticalSpace(isSuccess ? 26 : 24),
                CustomButton(
                  text: widget.actionText,
                  onPressed: _handlePrimaryAction,
                  height: isSuccess ? null : 48.h,
                  borderRadius: isSuccess ? null : 14,
                  background: isSuccess ? null : ColorPalette.accent,
                  foreground: isSuccess ? null : ColorPalette.textPrimary,
                  textStyle: isSuccess
                      ? null
                      : AppTextStyle.font16TextPrimaryBoldTajawal(),
                ),
                if (hasSecondaryAction) ...[
                  verticalSpace(isSuccess ? 12 : 8),
                  if (isSuccess)
                    CustomSecondaryButton(
                      text: widget.secondaryActionText!,
                      onPressed: _handleSecondaryAction,
                    )
                  else
                    TextButton(
                      onPressed: _handleSecondaryAction,
                      style: TextButton.styleFrom(
                        foregroundColor: ColorPalette.textMuted,
                      ),
                      child: Text(widget.secondaryActionText!),
                    ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
