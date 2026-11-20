import 'package:bta3_physia/core/style/app_animations.dart';
import 'package:bta3_physia/core/transition/electric_transition.dart';
import 'package:flutter/material.dart';

abstract final class AppTransition {
  const AppTransition._();

  static Route<dynamic> simpleTransition({
    required Widget screen,
    RouteSettings? settings,
  }) {
    return AppAnimations.screenFade(
      screen: screen,
      duration: 380,
      settings: settings,
    );
  }

  static PageRouteBuilder<void> electricTransition({
    required Widget screen,
    RouteSettings? settings,
  }) {
    return PageRouteBuilder<void>(
      settings: settings,
      transitionDuration: ElectricTransition.duration,
      reverseTransitionDuration: ElectricTransition.duration,
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder:
          (
            _,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return ElectricTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
    );
  }
}
