import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/features/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:bta3_physia/features/notifications/presentation/cubit/notifications_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildFilterTabs extends StatelessWidget {
  final ExamsState state;
  const BuildFilterTabs({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NotificationsCubit>();
    final isAll = state.filter == NotificationFilter.all;

    return Container(
      height: 48.h,
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: ColorPalette.fieldFill,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          // Unread Only Tab
          Expanded(
            child: GestureDetector(
              onTap: () => cubit.setFilter(NotificationFilter.unreadOnly),
              child: Container(
                decoration: BoxDecoration(
                  color: !isAll ? ColorPalette.accent : Colors.transparent,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: Text(
                    'غير المقروءة',
                    style: !isAll
                        ? AppTextStyle.font14TextPrimaryBoldTajawal()
                        : AppTextStyle.font14TextLightSemiBoldTajawal(),
                  ),
                ),
              ),
            ),
          ),

          // All Tab
          Expanded(
            child: GestureDetector(
              onTap: () => cubit.setFilter(NotificationFilter.all),
              child: Container(
                decoration: BoxDecoration(
                  color: isAll ? ColorPalette.accent : Colors.transparent,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: Text(
                    'الكل',
                    style: isAll
                        ? AppTextStyle.font14TextPrimaryBoldTajawal()
                        : AppTextStyle.font14TextLightSemiBoldTajawal(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
