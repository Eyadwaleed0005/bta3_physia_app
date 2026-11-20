import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SolveBottomBar extends StatelessWidget {
  final bool isFirstQuestion;
  final bool isLastQuestion;
  final VoidCallback onPreviousPressed;
  final VoidCallback onNextPressed;
  final VoidCallback onSubmitPressed;

  const SolveBottomBar({
    super.key,
    required this.isFirstQuestion,
    required this.isLastQuestion,
    required this.onPreviousPressed,
    required this.onNextPressed,
    required this.onSubmitPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 44.h,
          decoration: BoxDecoration(
            color: ColorPalette.fieldFill,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            children: [
              Expanded(
                child: _SolveBarAction(
                  label: 'السابق',
                  isEnabled: !isFirstQuestion,
                  onPressed: onPreviousPressed,
                ),
              ),
              Container(width: 1.w, height: 22.h, color: ColorPalette.border),
              Expanded(
                child: _SolveBarAction(
                  label: 'التالي',
                  isEnabled: !isLastQuestion,
                  onPressed: onNextPressed,
                ),
              ),
            ],
          ),
        ),
        verticalSpace(16),
        CustomButton(
          onPressed: onSubmitPressed,
          height: 44.h,
          background: ColorPalette.accent,
          foreground: ColorPalette.textPrimary,
          borderRadius: 22.r,
          text: 'تسليم الامتحان',
          textStyle: AppTextStyle.font16TextPrimaryBoldTajawal(),
        ),
      ],
    );
  }
}

class _SolveBarAction extends StatelessWidget {
  final String label;
  final bool isEnabled;
  final VoidCallback onPressed;

  const _SolveBarAction({
    required this.label,
    required this.isEnabled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isEnabled ? onPressed : null,
      borderRadius: BorderRadius.circular(16.r),
      child: Center(
        child: Text(
          label,
          style: isEnabled
              ? AppTextStyle.font14TextLightBoldTajawal()
              : AppTextStyle.font14TextMutedRegularTajawal().copyWith(
                  color: ColorPalette.border,
                ),
        ),
      ),
    );
  }
}
