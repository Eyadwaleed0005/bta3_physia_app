import 'package:bta3_physia/app/routes/screen_routes/app_routes.dart';
import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/core/services/device_preview_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Bta3PhysiaApp extends StatelessWidget {
  const Bta3PhysiaApp({super.key});

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          title: 'بتاع فيزياء',
          debugShowCheckedModeBanner: false,
          locale: DevicePreviewService.locale(context),
          theme: ThemeData(),
          initialRoute: RouteNames.splashScreen,
          onGenerateRoute: AppRoutes.generateRoute,
          builder: _buildApp,
        );
      },
    );
  }

  Widget _buildApp(BuildContext context, Widget? child) {
    final Widget previewedChild = DevicePreviewService.appBuilder(
      context,
      child,
    );

    return previewedChild;
  }
}
