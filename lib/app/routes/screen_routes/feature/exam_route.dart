import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/features/exams/presentation/screens/exams_screen.dart';
import 'package:flutter/material.dart';

abstract final class ExamRoutes {
  const ExamRoutes._();

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.examsScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ExamsScreen(),
        );

      default:
        return null;
    }
  }
}
