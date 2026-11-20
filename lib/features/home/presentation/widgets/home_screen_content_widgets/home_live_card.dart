import 'package:bta3_physia/app/routes/app_images_routes.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeLiveCard extends StatelessWidget {
  const HomeLiveCard({
    super.key,
    this.isLive = true,
    this.title = 'مراجعة قوانين الحركة',
    this.instructor = 'مع الأستاذ جمال محمد',
    this.onJoinPressed,
    this.onOpenExternalPressed,
  });

  final bool isLive;
  final String title;
  final String instructor;
  final VoidCallback? onJoinPressed;
  final VoidCallback? onOpenExternalPressed;

  @override
  Widget build(BuildContext context) {
    if (!isLive) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: ColorPalette.fieldFill,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Center(
              child: SvgPicture.asset(
                AppImage().live,
                height: 24.h,
                width: 24.w,
              ),
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'لا يوجد بث مباشر حاليًا',
                  style: AppTextStyle.font16TextLightBoldTajawal(),
                ),
                verticalSpace(4),
                Text(
                  'سيظهر بث صفّك هنا عند بدئه.',
                  style: AppTextStyle.font13TextMutedRegularTajawal(),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: ColorPalette.fieldFill,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: ColorPalette.fieldBorder),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Live Indicator Row
          Row(
            children: [
              IconButton(
                onPressed: onOpenExternalPressed,
                icon: Icon(
                  Icons.open_in_new_rounded,
                  color: ColorPalette.wine200,
                  size: 20.r,
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              const Spacer(),
              Text(
                'بث مباشر الآن',
                style: AppTextStyle.font13TextHighLightBoldTajawal(),
              ),
              horizontalSpace(8),
              Icon(Icons.circle, size: 8.r, color: ColorPalette.accent),
            ],
          ),
          verticalSpace(10),
          // Content Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Join Button
              Expanded(
                flex: 5,
                child: CustomButton(
                  onPressed: onJoinPressed,
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  height: 44.h,
                  background: ColorPalette.accent,
                  foreground: ColorPalette.textPrimary,
                  borderRadius: 12.r,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.arrow_back,
                        size: 16.r,
                        color: ColorPalette.textPrimary,
                      ),
                      horizontalSpace(4),
                      Flexible(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'انضم إلى البث',
                            style: AppTextStyle.font14TextPrimaryBoldTajawal(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              horizontalSpace(10),
              // Titles
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: AppTextStyle.font16TextLightBoldTajawal(),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                    ),
                    verticalSpace(4),
                    Text(
                      instructor,
                      style: AppTextStyle.font13TextMutedRegularTajawal(),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
