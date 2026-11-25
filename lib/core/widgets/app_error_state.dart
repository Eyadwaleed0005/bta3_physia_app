import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppErrorState extends StatelessWidget {
  const AppErrorState({
    super.key,
    required this.message,
    this.onRetry,
    this.retryText = 'إعادة المحاولة',
  });

  final String message;
  final VoidCallback? onRetry;
  final String retryText;

  bool get _isNetworkError {
    final normalizedMessage = message.trim().toLowerCase();

    return const [
      'الإنترنت',
      'الانترنت',
      'الشبكة',
      'الاتصال',
      'network',
      'internet',
      'offline',
      'socket',
    ].any(normalizedMessage.contains);
  }

  @override
  Widget build(BuildContext context) {
    final icon = _isNetworkError
        ? Icons.wifi_off_rounded
        : Icons.error_outline_rounded;

    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 360.w),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: ColorPalette.fieldFill,
                borderRadius: BorderRadius.circular(18.r),
                border: Border.all(color: ColorPalette.fieldBorder),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40.r,
                        height: 40.r,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: ColorPalette.crimsonHover.withValues(
                            alpha: 0.12,
                          ),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Icon(
                          icon,
                          size: 22.r,
                          color: ColorPalette.crimsonHover,
                        ),
                      ),
                      horizontalSpace(12),
                      Expanded(
                        child: Semantics(
                          liveRegion: true,
                          child: Text(
                            message,
                            style: AppTextStyle.font15TextMutedRegularTajawal()
                                .copyWith(
                                  color: ColorPalette.textLight,
                                  height: 1.5,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (onRetry != null) ...[
                    verticalSpace(12),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: TextButton.icon(
                        onPressed: onRetry,
                        icon: Icon(Icons.refresh_rounded, size: 18.r),
                        label: Text(retryText),
                        style: TextButton.styleFrom(
                          foregroundColor: ColorPalette.accent,
                          textStyle:
                              AppTextStyle.font14TextLightSemiBoldTajawal(),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
