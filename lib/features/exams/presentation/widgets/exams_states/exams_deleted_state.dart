import 'package:bta3_physia/app/routes/app_images_routes.dart';
import 'package:flutter/material.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/core/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExamsDeletedState extends StatelessWidget {
  final VoidCallback onReturnPressed;

  const ExamsDeletedState({super.key, required this.onReturnPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          decoration: BoxDecoration(
            color: ColorPalette.panelGlass,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SvgPicture.asset(AppImage().blueExam, width: 36.r, height: 36.r),
              verticalSpace(14),
              Text(
                'حُذف الامتحان',
                textAlign: TextAlign.end,
                style: AppTextStyle.font20TextLightBoldTajawal(),
              ),
              verticalSpace(8),
              Text(
                'حُذف الامتحان قبل استلام إجاباتك، وتعذّر قبول التسليم. توقفت إعادة الإرسال، ولن تظهر نتيجة لهذه المحاولة.',
                textAlign: TextAlign.end,
                style: AppTextStyle.font14TextMutedRegularTajawal(),
              ),
            ],
          ),
        ),
        verticalSpace(16),
        CustomButton(
          onPressed: onReturnPressed,
          height: 48.h,
          background: ColorPalette.accent,
          foreground: ColorPalette.textPrimary,
          borderRadius: 24.r,
          text: 'العودة إلى الامتحانات',
          textStyle: AppTextStyle.font16TextPrimaryBoldTajawal(),
        ),
      ],
    );
  }
}
