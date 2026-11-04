import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/features/notifications/presentation/cubit/notifications_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildAppBar extends StatelessWidget {
  final ExamsState state;
  final bool isPermission;
  const BuildAppBar({
    super.key,
    required this.state,
    required this.isPermission,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
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
        // Title & Grade
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              isPermission ? 'تنبيهات الجهاز' : 'الإشعارات',
              style: AppTextStyle.font22TextLightBoldTajawal(),
            ),
            Text(
              state.grade,
              style: AppTextStyle.font13TextMutedRegularTajawal(),
            ),
          ],
        ),
      ],
    );
  }
}
