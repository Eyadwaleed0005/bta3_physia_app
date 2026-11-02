import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:bta3_physia/features/auth/presentation/widgets/auth_widgets/auth_backdrop.dart';
import 'package:bta3_physia/features/auth/presentation/widgets/auth_widgets/auth_brand_mark.dart';
import 'package:bta3_physia/features/auth/presentation/widgets/auth_widgets/auth_link_text.dart';
import 'package:bta3_physia/features/auth/presentation/widgets/login_widgets/login_form.dart';
import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';

class LoginScreenContent extends StatelessWidget {
  const LoginScreenContent({super.key});

  void _openRegister(BuildContext context) {
    Navigator.of(context).pushNamed(RouteNames.registerScreen);
  }

  void _backToOnboarding(BuildContext context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(RouteNames.onboardingScreen, (route) => false);
  }

  void _onAuthenticated(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      RouteNames.mainNavigationScreen,
      (Route<dynamic> route) {
        return false;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (LoginState previous, LoginState current) {
        return current is LoginAuthenticated;
      },
      listener: (BuildContext context, LoginState state) {
        _onAuthenticated(context);
      },
      child: AuthBackdrop(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                verticalSpace(7),
                const Center(child: AuthBrandMark(height: 81, showHalo: true)),
                verticalSpace(29),
                Text(
                  'مع الأستاذ جمال محمد',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.font18TextMutedRegularTajawal(),
                ),
                verticalSpace(14),
                Text(
                  'هل أنت مستعدّ للبدء؟',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.font30TextLightBoldTajawal(),
                ),
                verticalSpace(6),
                Text(
                  'سجّل دخولك لبدء رحلة التعلّم.',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.font18TextMutedRegularTajawal(),
                ),
                verticalSpace(44),
                const LoginForm(),
                verticalSpace(12),
                AuthLinkText(
                  leading: 'ليس لديك حساب؟',
                  action: 'أنشئ حسابًا',
                  style: AppTextStyle.font17TextHighlightRegularTajawal(),
                  onTap: () => _openRegister(context),
                ),
                verticalSpace(33),
                AuthLinkText(
                  action: 'إعادة عرض التعريف',
                  onTap: () => _backToOnboarding(context),
                ),
                verticalSpace(24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
