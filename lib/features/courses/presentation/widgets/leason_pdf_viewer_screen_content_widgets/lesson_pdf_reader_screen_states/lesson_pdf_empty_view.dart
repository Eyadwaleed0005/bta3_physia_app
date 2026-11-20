import 'package:bta3_physia/app/routes/app_images_routes.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/core/widgets/app_empty_state.dart';
import 'package:bta3_physia/features/courses/presentation/widgets/leason_pdf_viewer_screen_content_widgets/lesson_pdf_state_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LessonPdfEmptyView extends StatelessWidget {
  const LessonPdfEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.orientationOf(context) == Orientation.landscape;

    final iconContainerSize = isLandscape ? 80.0 : 136.0;

    final iconSize = isLandscape ? 58.0 : 102.0;

    final iconTitleSpacing = isLandscape ? 12.0 : 36.0;

    final titleStyle = AppTextStyle.font20TextPrimarySemiBoldKufam().copyWith(
      fontSize: isLandscape ? 15 : null,
    );

    return LessonPdfStateLayout(
      child: AppEmptyState(
        title: 'لا يوجد ملف للدرس حاليًا',
        titleStyle: titleStyle,
        iconContainerSize: iconContainerSize,
        iconBackgroundColor: ColorPalette.disabled,
        iconTitleSpacing: iconTitleSpacing,
        iconWidget: SvgPicture.asset(
          AppImage().emptyBookOpen,
          width: iconSize,
          height: iconSize,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
