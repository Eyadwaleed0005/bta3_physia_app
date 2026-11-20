import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/widgets/custom_app_bar.dart';
import 'package:bta3_physia/features/live/presentation/cubit/live_cubit.dart';
import 'package:bta3_physia/features/live/presentation/cubit/live_state.dart';
import 'package:bta3_physia/features/live/presentation/widgets/live_screen_content_widgets/live_body_for_mode.dart';
import 'package:bta3_physia/features/live/presentation/widgets/live_states/live_grade_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LiveScreenContent extends StatelessWidget {
  const LiveScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LiveCubit, LiveState>(
      builder: (context, state) {
        final cubit = context.read<LiveCubit>();
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomAppBar(
                title: 'البث المباشر',
                subTitle: state.teacher,
                icon: Icons.refresh,
                iconTap: () => cubit.refresh(),
                showContentOnly: false,
              ),
              verticalSpace(12),
              LiveGradeBar(subject: state.subject, grade: state.grade),
              verticalSpace(16),
              Expanded(
                child: Center(child: LiveBodyForMode(state: state)),
              ),
            ],
          ),
        );
      },
    );
  }
}
