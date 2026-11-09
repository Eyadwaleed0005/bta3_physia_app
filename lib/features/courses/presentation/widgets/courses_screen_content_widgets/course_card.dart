import 'package:bta3_physia/app/routes/app_images_routes.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/core/widgets/custom_button.dart';
import 'package:bta3_physia/features/courses/data/models/course_model.dart';
import 'package:bta3_physia/features/courses/presentation/widgets/course_free_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
    required this.course,
    this.onOpen,
    this.onActivate,
  });

  final CourseModel course;
  final VoidCallback? onOpen;
  final VoidCallback? onActivate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorPalette.fieldFill,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: ColorPalette.fieldBorder),
      ),
      clipBehavior: Clip.antiAlias,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: 160.h,
            width: double.infinity,
            child: FadeInImage(
              placeholder: AssetImage(AppImage().courseBanner),
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
              image: AssetImage(AppImage().courseBanner),
            ),
          ),
          verticalSpace(6),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  course.title,
                  style: AppTextStyle.font18TextLightBoldTajawal(),
                ),
                verticalSpace(6),
                Text(
                  course.description,
                  style: AppTextStyle.font13TextMutedRegularTajawal(),
                ),
                verticalSpace(16),
                if (course.isFree)
                  Row(
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: onOpen,
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
                              'ابدأ التعلّم',
                              style:
                                  AppTextStyle.font14TextHighlightBoldTajawal(),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      const CourseFreeBadge(),
                    ],
                  )
                else
                  CustomButton(
                    onPressed: onActivate,
                    height: 48.h,
                    background: ColorPalette.accent,
                    foreground: ColorPalette.textPrimary,
                    borderRadius: 24.r,
                    text: 'تفعيل الاشتراك',
                    prefixIcon: Icon(Icons.lock_outline_rounded),
                    textStyle: AppTextStyle.font15TextPrimaryBoldTajawal(),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
