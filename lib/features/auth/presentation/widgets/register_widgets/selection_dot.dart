import 'package:bta3_physia/core/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectionDot extends StatelessWidget {
  const SelectionDot({super.key, required this.selected});

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24.r,
      height: 24.r,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
        border: Border.all(
          color: selected ? ColorPalette.accent : ColorPalette.border,
          width: 1.5.r,
        ),
      ),
      child: selected
          ? Icon(Icons.circle, size: 16.r, color: ColorPalette.accent)
          : null,
    );
  }
}
