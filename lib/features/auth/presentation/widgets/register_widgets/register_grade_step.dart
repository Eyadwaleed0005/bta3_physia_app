import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/features/auth/model/grade_option.dart';
import 'package:bta3_physia/features/auth/presentation/cubit/register_cubit/register_cubit.dart';
import 'package:bta3_physia/features/auth/presentation/widgets/register_widgets/grade_option_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterGradeStep extends StatelessWidget {
  const RegisterGradeStep({super.key});

  bool _shouldRebuild(RegisterState previous, RegisterState current) {
    if (current is! RegisterFormState || previous is! RegisterFormState) {
      return true;
    }

    return previous.grade != current.grade ||
        previous.gradeError != current.gradeError;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: _shouldRebuild,
      builder: (BuildContext context, RegisterState state) {
        final RegisterFormState form = state is RegisterFormState
            ? state
            : const RegisterFormState();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            for (final GradeOption grade in GradeOption.values) ...<Widget>[
              GradeOptionTile(
                label: grade.label,
                selected: form.grade == grade,
                onTap: () {
                  context.read<RegisterCubit>().selectGrade(grade);
                },
              ),
              verticalSpace(16),
            ],
            if (form.gradeError != null) ...<Widget>[
              Text(
                form.gradeError!,
                textAlign: TextAlign.right,
                style: AppTextStyle.font12ErrorRegularTajawal(),
              ),
              verticalSpace(8),
            ],
            Text(
              'يُربط حسابك بهذا الصف، ويمكن للمدرس تصحيحه عند الحاجة.',
              textAlign: TextAlign.right,
              style: AppTextStyle.font15TextMutedRegularTajawal(),
            ),
          ],
        );
      },
    );
  }
}
