import 'package:bta3_physia/app/routes/app_images_routes.dart';
import 'package:bta3_physia/core/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    this.size = 80,
    this.avatarIndex = 0,
    this.onTap,
    this.showSwapButton = false,
  });

  static const int avatarsCount = 3;

  final double size;
  final int avatarIndex;
  final VoidCallback? onTap;
  final bool showSwapButton;

  static String assetFor(int index) {
    final AppImage images = AppImage();
    switch (index) {
      case 1:
        return images.avatar2;
      case 2:
        return images.avatar3;
      default:
        return images.avatar1;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double diameter = size.r;

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            width: diameter,
            height: diameter,
            child: SvgPicture.asset(
              assetFor(avatarIndex),
              width: diameter,
              height: diameter,
              fit: BoxFit.cover,
            ),
          ),

          if (showSwapButton)
            Positioned(
              bottom: -3,
              left: 0,
              child: Icon(
                Icons.swap_horizontal_circle_rounded,
                size: 30.r,
                color: ColorPalette.accent,
              ),
            ),
        ],
      ),
    );
  }
}
