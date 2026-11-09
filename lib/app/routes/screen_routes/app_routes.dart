import 'package:bta3_physia/app/routes/screen_routes/feature/app_startup_routes.dart';
import 'package:bta3_physia/app/routes/screen_routes/feature/auth_routes.dart';
import 'package:bta3_physia/app/routes/screen_routes/feature/courses_routes.dart';
import 'package:bta3_physia/app/routes/screen_routes/feature/exam_routes.dart';
import 'package:bta3_physia/app/routes/screen_routes/feature/home_routes.dart';
import 'package:bta3_physia/app/routes/screen_routes/feature/lesson_quiz_routes.dart';
import 'package:bta3_physia/app/routes/screen_routes/feature/main_navigation.dart';
import 'package:bta3_physia/app/routes/screen_routes/feature/notifications_routes.dart';
import 'package:bta3_physia/app/routes/screen_routes/feature/results_routes.dart';
import 'package:flutter/material.dart';

abstract final class AppRoutes {
  const AppRoutes._();

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    return AppStartupRoutes.generateRoute(settings) ??
        AuthRoutes.generateRoute(settings) ??
        MainNavigationRoutes.generateRoute(settings) ??
        HomeRoutes.generateRoute(settings) ??
        CoursesRoutes.generateRoute(settings) ??
        NotificationsRoutes.generateRoute(settings) ??
        ExamRoutes.generateRoute(settings) ??
        ResultsRoutes.generateRoute(settings) ??
        LessonQuizRoutes.generateRoute(settings) ??
        _buildUnknownRoute(settings);
  }

  static Route<dynamic> _buildUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute<void>(
      settings: settings,
      builder: (_) {
        return const Scaffold(
          body: Center(
            child: Text(
              'الصفحة المطلوبة غير موجودة',
              textDirection: TextDirection.rtl,
            ),
          ),
        );
      },
    );
  }
}
