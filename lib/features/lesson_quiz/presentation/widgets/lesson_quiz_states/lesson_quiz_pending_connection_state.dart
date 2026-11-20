import 'package:flutter/material.dart';
import 'package:bta3_physia/core/widgets/custom_secondary_button.dart';
import 'package:bta3_physia/app/routes/app_images_routes.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/core/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LessonQuizPendingConnectionState extends StatelessWidget {
  final VoidCallback? onRetryPressed;
  final VoidCallback? onReturnPressed;

  const LessonQuizPendingConnectionState({
    super.key,
    this.onRetryPressed,
    this.onReturnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
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
                'في انتظار الاتصال',
                textAlign: TextAlign.end,
                style: AppTextStyle.font20TextLightBoldTajawal(),
              ),
              verticalSpace(8),
              Text(
                'حُفظت إجاباتك على هذا الجهاز. سنرسلها تلقائيًا عند عودة الاتصال، حتى لو أُغلق استقبال المحاولات.',
                textAlign: TextAlign.end,
                style: AppTextStyle.font14TextMutedRegularTajawal(),
              ),
            ],
          ),
        ),
        verticalSpace(16),

        CustomButton(
          onPressed: onRetryPressed,
          titleForRefreash: 'إعادة المحاولة',
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
        verticalSpace(16),

        CustomSecondaryButton(
          onPressed: onReturnPressed,
          height: 48.h,
          backgroundColor: ColorPalette.fieldFill,
          foregroundColor: ColorPalette.textLight,
          text: 'العودة إلى القائمة',
          borderRadius: 24.r,
          borderColor: ColorPalette.border,
          textStyle: AppTextStyle.font16TextPrimaryBoldTajawal(),
        ),
      ],
    );
  }
}
