import 'package:bta3_physia/app/routes/app_images_routes.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ResultsFailureState extends StatelessWidget {
  final VoidCallback onRetryPressed;

  const ResultsFailureState({super.key, required this.onRetryPressed});

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
                'تعذّر تحميل النتائج',
                textAlign: TextAlign.end,
                style: AppTextStyle.font20TextLightBoldTajawal(),
              ),
              verticalSpace(8),
              Text(
                'تحقق من اتصالك ثم أعد المحاولة. نتائجك المحفوظة لن تُفقد.',
                textAlign: TextAlign.end,
                style: AppTextStyle.font14TextMutedRegularTajawal(),
              ),
            ],
          ),
        ),
        verticalSpace(16),
        CustomButton(
          onPressed: onRetryPressed,
          titleForRefreash: 'جارٍ إعادة المحاولة',
          height: 48.h,
          background: ColorPalette.accent,
          foreground: ColorPalette.textPrimary,
          borderRadius: 24.r,
          textStyle: AppTextStyle.font16TextPrimaryBoldTajawal(),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.refresh_rounded,
                size: 20.r,
                color: ColorPalette.textPrimary,
              ),
              horizontalSpace(8),
              Text(
                'إعادة المحاولة',
                style: AppTextStyle.font16TextPrimaryBoldTajawal(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
