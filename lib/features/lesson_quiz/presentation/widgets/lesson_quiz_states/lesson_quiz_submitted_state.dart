import 'package:flutter/material.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/core/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LessonQuizSubmittedState extends StatelessWidget {
  final VoidCallback onResultPressed;
  const LessonQuizSubmittedState({super.key, required this.onResultPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          decoration: BoxDecoration(
            color: ColorPalette.panelGlass,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'اكتملت الإجابة عن جميع الأسئلة',
                textAlign: TextAlign.center,
                style: AppTextStyle.font12TextSecondaryBoldTajawal(),
              ),
              verticalSpace(14),
              Text(
                'تم تسليم الامتحان',
                textAlign: TextAlign.center,
                style: AppTextStyle.font22TextLightBoldTajawal(),
              ),
              verticalSpace(8),
              Text(
                'اضغط على «عرض النتائج» لمعرفة درجتك ومراجعة إجاباتك.',
                textAlign: TextAlign.center,
                style: AppTextStyle.font14TextMutedRegularTajawal(),
              ),
              verticalSpace(16),
              CustomButton(
                onPressed: onResultPressed,
                height: 48.h,
                background: ColorPalette.accent,
                foreground: ColorPalette.textPrimary,
                borderRadius: 24.r,
                textStyle: AppTextStyle.font16TextPrimaryBoldTajawal(),
                text: 'عرض النتائج',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
