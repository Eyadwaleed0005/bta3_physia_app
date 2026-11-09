import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/features/courses/presentation/cubit/course_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoursesFilterTabs extends StatelessWidget {
  const CoursesFilterTabs({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  final CourseFilter selected;
  final void Function(CourseFilter) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: ColorPalette.fieldFill,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(color: ColorPalette.fieldBorder),
      ),
      child: Row(
        children: [
          _FilterTab(
            label: 'المدفوعة',
            isSelected: selected == CourseFilter.paid,
            onTap: () => onChanged(CourseFilter.paid),
          ),
          _FilterTab(
            label: 'المجانية',
            isSelected: selected == CourseFilter.free,
            onTap: () => onChanged(CourseFilter.free),
          ),
        ],
      ),
    );
  }
}

class _FilterTab extends StatelessWidget {
  const _FilterTab({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14.r),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(vertical: 10.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? ColorPalette.accent : Colors.transparent,
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: isSelected
                ? AppTextStyle.font14TextPrimaryBoldTajawal()
                : AppTextStyle.font14TextMutedRegularTajawal(),
          ),
        ),
      ),
    );
  }
}
