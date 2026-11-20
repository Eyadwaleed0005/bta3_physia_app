import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeFailureState extends StatelessWidget {
  const HomeFailureState({
    super.key,
    this.title = 'تعذّر تحميل المحتوى',
    this.subtitle = 'تحقّق من اتصالك بالإنترنت،\nثم أعد تحميل الصفحة.',
    this.buttonText = 'إعادة المحاولة',
    this.onRetryPressed,
  });

  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback? onRetryPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon Container
            Container(
              width: 88.w,
              height: 88.h,
              decoration: BoxDecoration(
                color: ColorPalette.fieldFill,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Center(
                child: Icon(
                  Icons.wifi_off_rounded,
                  size: 38.r,
                  color: ColorPalette.wine200,
                ),
              ),
            ),
            verticalSpace(24),

            // Title
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyle.font20TextLightRegularTajawal().copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            verticalSpace(10),

            // Subtitle
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: AppTextStyle.font14TextMutedRegularTajawal().copyWith(
                height: 1.5,
              ),
            ),
            verticalSpace(28),

            // Retry Button
            CustomButton(
              onPressed: onRetryPressed,
              height: 48.h,
              background: ColorPalette.accent,
              foreground: ColorPalette.textPrimary,
              borderRadius: 24.r,
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
                    buttonText,
                    style: AppTextStyle.font14TextPrimaryBoldTajawal(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

