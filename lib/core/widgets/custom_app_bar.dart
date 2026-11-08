import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  final bool showContentOnly;
  final String title;
  final String subTitle;

  const CustomAppBar({
    super.key,
    this.showContentOnly = true,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (showContentOnly)
          InkWell(
            onTap: () {
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              } else {
                Navigator.of(context)
                    .pushReplacementNamed(RouteNames.mainNavigationScreen);
              }
            },
            borderRadius: BorderRadius.circular(14.r),
            child: Container(
              width: 44.w,
              height: 44.h,
              decoration: BoxDecoration(
                color: ColorPalette.fieldFill,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 18.r,
                  color: ColorPalette.teal200,
                ),
              ),
            ),
          ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: AppTextStyle.font22TextLightBoldTajawal()),
            Text(subTitle, style: AppTextStyle.font13TextMutedRegularTajawal()),
          ],
        ),
      ],
    );
  }
}
