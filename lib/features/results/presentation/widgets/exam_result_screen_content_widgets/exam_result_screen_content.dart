import 'package:bta3_physia/app/dependency_injection/service_locator.dart';
import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/core/constant/main_navigation_tabs.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/widgets/custom_app_bar.dart';
import 'package:bta3_physia/features/main_navigation/presentation/cubit/bottom_navigation_cubit.dart';
import 'package:bta3_physia/features/results/presentation/cubit/results_cubit.dart';
import 'package:bta3_physia/features/results/presentation/cubit/results_state.dart';
import 'package:bta3_physia/features/results/presentation/widgets/exam_result_screen_content_widgets/exam_result_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExamResultScreenContent extends StatelessWidget {
  const ExamResultScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResultsCubit, ResultsState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomAppBar(
                title: state.resultTitle,
                subTitle: state.resultSubTitle,
                showContentOnly: false,
              ),
              verticalSpace(16),
              Expanded(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: ExamResultDetails(
                      state: state,
                      onReturnPressed: () => _returnToResults(context),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _returnToResults(BuildContext context) {
    getIt<BottomNavigationCubit>().changeIndex(MainNavigationTabs.results);

    Navigator.of(context).popUntil(
      (route) =>
          route.settings.name == RouteNames.mainNavigationScreen ||
          route.isFirst,
    );
  }
}
