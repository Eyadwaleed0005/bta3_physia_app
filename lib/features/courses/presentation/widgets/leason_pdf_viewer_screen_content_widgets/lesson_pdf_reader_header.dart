import 'package:bta3_physia/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LessonPdfReaderHeader extends StatelessWidget
    implements PreferredSizeWidget {
  const LessonPdfReaderHeader({
    super.key,
    required this.lessonTitle,
    required this.lessonSubTitle,
    required this.isLandscape,
  });

  final String lessonTitle;
  final String lessonSubTitle;
  final bool isLandscape;

  @override
  Size get preferredSize => Size.fromHeight(isLandscape ? 70.h : 80.h);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: isLandscape ? 4.h : 10.h,
      ),
      child: CustomAppBar(title: lessonTitle, subTitle: lessonSubTitle),
    );
  }
}
