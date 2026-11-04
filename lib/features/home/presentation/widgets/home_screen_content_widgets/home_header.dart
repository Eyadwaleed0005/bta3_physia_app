import 'package:bta3_physia/app/routes/app_images_routes.dart';
import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/features/notifications/presentation/cubit/notifications_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    this.userName = 'أحمد محمد',
    this.subtitle = 'هل أنت مستعد لتعلّم الفيزياء؟',
    this.unreadNotificationsCount = 2,
    this.onNotificationTap,
    this.onNotificationLongPress,
  });

  final String userName;
  final String subtitle;
  final int unreadNotificationsCount;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onNotificationLongPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            if (onNotificationTap != null) {
              onNotificationTap!();
            } else {
              Navigator.of(context).pushNamed(
                RouteNames.notificationsScreen,
                arguments: NotificationsViewMode.list,
              );
            }
          },

          child: Container(
            width: 44.w,
            height: 44.h,
            decoration: BoxDecoration(
              color: ColorPalette.fieldFill,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Center(
                  child: Icon(
                    Icons.notifications_none,
                    size: 24.r,
                    color: ColorPalette.cream50,
                  ),
                ),
                if (unreadNotificationsCount > 2)
                  Positioned(
                    right: 3.w,
                    top: 2.h,
                    child: Container(
                      width: 18.w,
                      height: 18.h,
                      decoration: const BoxDecoration(
                        color: ColorPalette.accent,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '$unreadNotificationsCount',
                          style: AppTextStyle.font11TextPrimaryBoldTajawal(),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),

        const Spacer(),

        // User Info
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              userName,
              style: AppTextStyle.font22TextLightBoldTajawal(),
              overflow: TextOverflow.ellipsis,
            ),
            Text(subtitle, style: AppTextStyle.font14TextMutedRegularTajawal()),
          ],
        ),

        horizontalSpace(12),

        // Logo
        SvgPicture.asset(
          AppImage().wordMark,
          fit: BoxFit.contain,
          width: 56.w,
          height: 35.h,
        ),
      ],
    );
  }
}
