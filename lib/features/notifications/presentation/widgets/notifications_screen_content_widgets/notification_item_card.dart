import 'package:bta3_physia/app/routes/app_images_routes.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/features/notifications/data/models/notification_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationItemCard extends StatelessWidget {
  const NotificationItemCard({super.key, required this.item, this.onTap});

  final NotificationItemModel item;
  final VoidCallback? onTap;

  String _iconForType(NotificationType type) {
    switch (type) {
      case NotificationType.live:
        return AppImage().blueLive;
      case NotificationType.lesson:
      case NotificationType.course:
        return AppImage().blueBook;
      case NotificationType.exam:
        return AppImage().category;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.r),
        child: Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: item.isRead
                ? ColorPalette.fieldFill
                : ColorPalette.panelGlass,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Unread indicator dot
              if (!item.isRead) ...[
                Container(
                  width: 8.w,
                  height: 8.h,
                  margin: EdgeInsets.only(top: 6.h, right: 8.w),
                  decoration: const BoxDecoration(
                    color: ColorPalette.accent,
                    shape: BoxShape.circle,
                  ),
                ),
              ] else ...[
                horizontalSpace(16),
              ],
              // Content Texts
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      item.title,
                      style: AppTextStyle.font16TextLightBoldTajawal(),
                      textAlign: TextAlign.right,
                    ),
                    verticalSpace(4),
                    Text(
                      item.body,
                      style: AppTextStyle.font13TextMutedRegularTajawal(),
                      textAlign: TextAlign.right,
                    ),
                    verticalSpace(6),
                    Text(
                      item.time,
                      style: AppTextStyle.font12TextSecondaryRegularTajawal(),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
              horizontalSpace(12),

              // Icon container
              Container(
                width: 48.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: item.isRead
                      ? ColorPalette.panelGlass
                      : ColorPalette.fieldFill,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    _iconForType(item.type),
                    width: 24.r,
                    height: 24.r,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
