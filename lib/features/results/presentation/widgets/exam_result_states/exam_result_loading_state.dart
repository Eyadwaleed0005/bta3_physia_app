import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/core/widgets/app_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExamResultLoadingState extends StatelessWidget {
  const ExamResultLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 48.h),
      child: Column(
        children: [
          const AppLoadingIndicator(color: ColorPalette.accent),
          verticalSpace(12),
          Text(
            'نجهّز نتيجتك',
            textAlign: TextAlign.center,
            style: AppTextStyle.font14TextMutedRegularTajawal(),
          ),
        ],
      ),
    );
  }
}
