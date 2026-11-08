import 'package:bta3_physia/app/routes/app_images_routes.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/core/widgets/app_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ResultsLoadingState extends StatelessWidget {
  const ResultsLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            'جارٍ تحميل النتائج',
            textAlign: TextAlign.end,
            style: AppTextStyle.font20TextLightBoldTajawal(),
          ),
          verticalSpace(8),
          Text(
            'نجمع نتائج محاولاتك المكتملة.',
            textAlign: TextAlign.end,
            style: AppTextStyle.font14TextMutedRegularTajawal(),
          ),
          verticalSpace(16),
          const Align(
            alignment: AlignmentDirectional.centerEnd,
            child: AppLoadingIndicator(color: ColorPalette.accent),
          ),
        ],
      ),
    );
  }
}
