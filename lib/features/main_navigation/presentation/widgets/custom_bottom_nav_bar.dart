import 'package:bta3_physia/app/routes/app_images_routes.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:bta3_physia/core/style/fontweighthelper.dart';
import 'package:bta3_physia/core/style/textstyles.dart';
import 'package:bta3_physia/features/main_navigation/presentation/cubit/bottom_navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavItemData {
  final String label;
  final String iconPath;

  const BottomNavItemData({required this.label, required this.iconPath});
}

class CustomBottomNavBar extends StatelessWidget {
  final int? currentIndex;
  final ValueChanged<int>? onItemSelected;

  const CustomBottomNavBar({super.key, this.currentIndex, this.onItemSelected});

  static const double _barHeight = 78;
  static const double _barRadius = 24;
  static const double _sideMargin = 24;
  static const double _barSidePadding = 12;
  static const double _barTopPadding = 14;
  static const double _barBottomPadding = 8;

  static const Duration _indicatorDuration = Duration(milliseconds: 180);
  static const Duration _itemDuration = Duration(milliseconds: 120);
  static const Curve _motionCurve = Curves.easeOutCubic;
  static const Curve _fadeCurve = Curves.easeInOut;

  static List<BottomNavItemData> get items => [
    BottomNavItemData(label: "الرئيسية", iconPath: AppImage().home),
    BottomNavItemData(label: "الكورسات", iconPath: AppImage().book),
    BottomNavItemData(label: 'البث', iconPath: AppImage().live),
    BottomNavItemData(label: 'النتائج', iconPath: AppImage().chart),
    BottomNavItemData(label: 'حسابي', iconPath: AppImage().user),
  ];

  @override
  Widget build(BuildContext context) {
    final navigationItems = items;

    final selectedIndex =
        currentIndex ?? context.watch<BottomNavigationCubit>().state;

    final activeIndex = selectedIndex.clamp(0, navigationItems.length - 1);

    void handleTap(int index) {
      if (onItemSelected != null) {
        onItemSelected!(index);
        return;
      }

      context.read<BottomNavigationCubit>().changeIndex(index);
    }

    final barHeight = _barHeight.h;

    final rectangleSize = 55.w;
    final rectangleTopOffset = -14.h;

    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.only(
          left: _sideMargin.w,
          right: _sideMargin.w,
          top: _barTopPadding.h,
          bottom: _barBottomPadding.h,
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final totalWidth = constraints.maxWidth;
              final itemWidth =
                  (totalWidth - _barSidePadding.w * 2) / navigationItems.length;
              double indicatorLeftFor(int index) {
                final itemCenter =
                    totalWidth -
                    _barSidePadding.w -
                    itemWidth / 2 -
                    index * itemWidth;
                return itemCenter - rectangleSize / 2;
              }

              return SizedBox(
                height: barHeight,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      height: barHeight,
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorPalette.panelGlass,
                          borderRadius: BorderRadius.circular(_barRadius.r),
                          border: Border.all(
                            color: ColorPalette.teal300,
                            width: 1.w,
                          ),
                        ),
                      ),
                    ),
                    ...List.generate(navigationItems.length, (index) {
                      return Positioned(
                        left: indicatorLeftFor(index),
                        top: rectangleTopOffset,
                        child: IgnorePointer(
                          child: AnimatedOpacity(
                            duration: _indicatorDuration,
                            curve: _fadeCurve,
                            opacity: activeIndex == index ? 1 : 0,
                            child: _SelectedRectangleIndicator(
                              iconPath: navigationItems[index].iconPath,
                              size: rectangleSize,
                            ),
                          ),
                        ),
                      );
                    }),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      height: barHeight,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                          _barSidePadding.w,
                          _barTopPadding.h,
                          _barSidePadding.w,
                          _barBottomPadding.h,
                        ),
                        child: Row(
                          children: List.generate(navigationItems.length, (
                            index,
                          ) {
                            final isSelected = activeIndex == index;
                            final item = navigationItems[index];

                            return Expanded(
                              child: GestureDetector(
                                onTap: () => handleTap(index),
                                behavior: HitTestBehavior.opaque,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 24.w,
                                      child: AnimatedOpacity(
                                        duration: _indicatorDuration,
                                        curve: _fadeCurve,
                                        opacity: isSelected ? 0 : 1,
                                        child: ColorFiltered(
                                          colorFilter: const ColorFilter.mode(
                                            ColorPalette.teal100,
                                            BlendMode.srcIn,
                                          ),
                                          child: SvgPicture.asset(
                                            item.iconPath,
                                            width: 24.w,
                                            height: 24.w,
                                          ),
                                        ),
                                      ),
                                    ),
                                    verticalSpace(4),
                                    AnimatedDefaultTextStyle(
                                      duration: _itemDuration,
                                      curve: _motionCurve,
                                      style:
                                          AppTextStyle.font12TextSecondaryMediumTajawal()
                                              .copyWith(
                                                color: isSelected
                                                    ? ColorPalette.highlight
                                                    : ColorPalette.teal100,
                                                fontWeight: isSelected
                                                    ? FontWeightHelper.bold
                                                    : FontWeightHelper.regular,
                                              ),
                                      child: Text(
                                        item.label,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _SelectedRectangleIndicator extends StatelessWidget {
  final String iconPath;
  final double size;

  const _SelectedRectangleIndicator({
    required this.iconPath,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: ColorPalette.accent,
      ),
      child: Center(
        child: ColorFiltered(
          colorFilter: const ColorFilter.mode(
            ColorPalette.primary,
            BlendMode.srcIn,
          ),
          child: SvgPicture.asset(
            iconPath,
            width: 24.w,
            height: 24.w,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
