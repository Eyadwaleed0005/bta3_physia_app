import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/core/widgets/custom_app_bar.dart';
import 'package:bta3_physia/core/widgets/custom_button.dart';
import 'package:bta3_physia/features/profile/data/models/profile_account_model.dart';
import 'package:bta3_physia/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:bta3_physia/features/profile/presentation/cubit/profile_state.dart';
import 'package:bta3_physia/features/profile/presentation/widgets/accounts_screen_content_widgets/account_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountsScreenContent extends StatelessWidget {
  const AccountsScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final cubit = context.read<ProfileCubit>();
        final List<ProfileAccountModel> accounts = state.accounts;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CustomAppBar(
                title: 'الحسابات',
                subTitle: 'اختر حسابًا آخر للمتابعة',
              ),
              verticalSpace(16),
              Expanded(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'لكل حساب صفه الدراسي واشتراكاته ونتائجه.',
                        textAlign: TextAlign.right,
                        style: AppTextStyle.font14TextMutedRegularTajawal(),
                      ),
                      verticalSpace(16),
                      for (int index = 0; index < accounts.length; index++) ...[
                        AccountCard(
                          account: accounts[index],
                          isActive: index == state.activeAccountIndex,
                          onTap: () {
                            cubit.switchAccount(index);
                          },
                        ),
                        verticalSpace(12),
                      ],
                      verticalSpace(8),
                      CustomButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        height: 48.h,
                        borderRadius: 24.r,
                        text: 'إضافة حساب',
                        textStyle: AppTextStyle.font15TextLightBoldTajawal(),
                        background: ColorPalette.accent,
                        foreground: ColorPalette.textBlack,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
