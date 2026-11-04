import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bta3_physia/features/home/presentation/cubit/home_state.dart';
import 'package:bta3_physia/features/home/presentation/widgets/home_screen_content_widgets/home_grade_bar.dart';
import 'package:bta3_physia/features/home/presentation/widgets/home_screen_content_widgets/home_header.dart';
import 'package:bta3_physia/features/home/presentation/widgets/home_screen_content_widgets/build_home_body_for_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return RefreshIndicator(
          color: ColorPalette.accent,
          backgroundColor: ColorPalette.teal500,
          onRefresh: () async {
            context.read<HomeCubit>().refresh();
            await Future.delayed(const Duration(milliseconds: 2000));
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HomeHeader(
                  userName: state.userName,
                  unreadNotificationsCount: state.unreadNotificationsCount,
                  onNotificationTap: () {
                    Navigator.of(context)
                        .pushNamed(RouteNames.notificationsScreen);
                  },
                ),

                verticalSpace(14),

                const HomeGradeBar(),

                verticalSpace(16),

                BuildHomeBodyForMode(state: state),

                verticalSpace(90),
              ],
            ),
          ),
        );
      },
    );
  }
}
