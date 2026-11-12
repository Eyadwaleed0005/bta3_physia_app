import 'package:bta3_physia/app/routes/app_images_routes.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCourseSection extends StatelessWidget {
  const HomeCourseSection({
    super.key,
    this.sectionTitle = 'كورساتك',
    this.viewAllTitle = 'عرض الكل',
    this.courseTitle = 'أساسيات الفيزياء',
    this.courseDescription = 'الكميات الفيزيائية ووحدات القياس.',
    this.badgeText = 'مجاني',
    this.actionText = 'ابدأ التعلّم',
    this.onViewAllTap,
    this.onCourseTap,
    this.onStartLearningTap,
  });

  final String sectionTitle;
  final String viewAllTitle;
  final String courseTitle;
  final String courseDescription;
  final String badgeText;
  final String actionText;
  final VoidCallback? onViewAllTap;
  final VoidCallback? onCourseTap;
  final VoidCallback? onStartLearningTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Section Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: onViewAllTap,
              child: Text(
                viewAllTitle,
                style: AppTextStyle.font14TextSecondaryBoldTajawal(),
              ),
            ),
            Text(
              sectionTitle,
              style: AppTextStyle.font18TextLightBoldTajawal(),
            ),
          ],
        ),

        verticalSpace(14),

        // Course Card
        InkWell(
          onTap: onCourseTap ?? onStartLearningTap,
          borderRadius: BorderRadius.circular(16.r),
          child: Container(
            decoration: BoxDecoration(
              color: ColorPalette.fieldFill,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: ColorPalette.fieldBorder),
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Banner Image
                SizedBox(
                  height: 160.h,
                  width: double.infinity,
                  child: FadeInImage(
                    placeholder: AssetImage(AppImage().courseBanner),
                    fit: BoxFit.fill,
                    filterQuality: FilterQuality.high,
                    image: AssetImage(AppImage().courseBanner),
                  ),
                ),

                // Card Details
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 14.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        courseTitle,
                        style: AppTextStyle.font18TextLightBoldTajawal(),
                        textAlign: TextAlign.right,
                      ),
                      verticalSpace(4),
                      Text(
                        courseDescription,
                        style: AppTextStyle.font13TextMutedRegularTajawal(),
                        textAlign: TextAlign.right,
                      ),
                      verticalSpace(12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Action Link
                          GestureDetector(
                            onTap: onStartLearningTap ?? onCourseTap,
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: ColorPalette.textHighLight,
                                    width: 1.5,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 3.h),
                                child: Text(
                                  actionText,
                                  style:
                                      AppTextStyle.font14TextHighlightBoldTajawal(),
                                ),
                              ),
                            ),
                          ),

                          // Free / Status Badge
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              color: ColorPalette.secondary,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Text(
                              badgeText,
                              style:
                                  AppTextStyle.font13TextHighLightBoldTajawal(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
