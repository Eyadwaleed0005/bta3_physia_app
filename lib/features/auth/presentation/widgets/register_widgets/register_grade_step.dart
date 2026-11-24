import 'package:bta3_physia/app/dependency_injection/service_locator.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/core/widgets/app_empty_state.dart';
import 'package:bta3_physia/core/widgets/app_error_state.dart';
import 'package:bta3_physia/core/widgets/app_loading_indicator.dart';
import 'package:bta3_physia/features/auth/presentation/cubit/register_cubit/register_cubit.dart';
import 'package:bta3_physia/features/auth/presentation/widgets/register_widgets/grade_option_tile.dart';
import 'package:bta3_physia/features/grades/presentation/cubit/grades_cubit.dart';
import 'package:bta3_physia/features/grades/presentation/cubit/grades_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterGradeStep extends StatelessWidget {
  const RegisterGradeStep({super.key});

  @override
  Widget build(BuildContext context) {
    final selection = context.select((RegisterCubit cubit) {
      final state = cubit.state;
      return (
        gradeId: state is RegisterFormState ? state.grade?.gradeId : null,
        error: state is RegisterFormState ? state.gradeError : null,
      );
    });

    return BlocProvider<GradesCubit>(
      create: (_) => getIt<GradesCubit>()..loadGrades(),
      child: BlocBuilder<GradesCubit, GradesState>(
        builder: (context, state) {
          return switch (state) {
            GradesInitial() || GradesLoading() => const Center(
              child: AppLoadingIndicator(title: 'جارٍ تحميل الصفوف الدراسية'),
            ),
            GradesEmpty() => AppEmptyState(
              title: 'لا توجد صفوف دراسية متاحة حاليًا',
              icon: Icons.school_outlined,
              iconColor: ColorPalette.accent,
              iconBackgroundColor: ColorPalette.fieldFill,
              titleStyle: AppTextStyle.font20TextLightBoldTajawal(),
            ),
            GradesFailure(:final error) => AppErrorState(
              message: error.message,
              retryText: 'إعادة المحاولة',
              onRetry: error.isRetryable
                  ? () => context.read<GradesCubit>().loadGrades()
                  : null,
            ),
            GradesLoaded(:final grades) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (final grade in grades) ...[
                  GradeOptionTile(
                    key: ValueKey(grade.gradeId),
                    label: grade.name,
                    selected: selection.gradeId == grade.gradeId,
                    onTap: () =>
                        context.read<RegisterCubit>().selectGrade(grade),
                  ),
                  verticalSpace(16),
                ],
                if (selection.error case final String message)
                  Text(
                    message,
                    style: AppTextStyle.font12ErrorRegularTajawal(),
                  ),
              ],
            ),
          };
        },
      ),
    );
  }
}
