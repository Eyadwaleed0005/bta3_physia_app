import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/core/helper/app_system_ui.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/features/auth/presentation/widgets/auth_widgets/auth_backdrop.dart';
import 'package:bta3_physia/features/auth/presentation/widgets/auth_widgets/auth_primary_button.dart';
import 'package:bta3_physia/features/auth/presentation/widgets/register_widgets/register_success_mark.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// `Register 04 / Success` — the standalone screen that appears after the
/// account is created. The electric transition brings the user here from the
/// register flow (triggered by [RegisterCompleted]) and the primary button
/// pushes login (also via the electric transition).
class RegisterSuccessScreen extends StatelessWidget {
  const RegisterSuccessScreen({super.key});

  void _goToLogin(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      RouteNames.loginScreen,
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppSystemUi.dark(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: AuthBackdrop(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // y=232 in Figma (390×844) → ~27% down the safe area.
                  // Using a Spacer ratio keeps it proportional on all sizes.
                  const Spacer(flex: 3),
                  const Center(child: RegisterSuccessMark()),
                  verticalSpace(36),
                  Text(
                    'حسابك جاهز!',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.font29TextLightBoldAlexandria(),
                  ),
                  verticalSpace(12),
                  Text(
                    'أُنشئ حسابك بنجاح.\nسجّل دخولك لبدء رحلة التعلّم.',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.font18TextMutedRegularTajawal(),
                  ),
                  const Spacer(flex: 4),
                  AuthPrimaryButton(
                    label: 'تسجيل الدخول',
                    onPressed: () => _goToLogin(context),
                  ),
                  verticalSpace(24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

