import 'package:bta3_physia/app/dependency_injection/service_locator.dart';
import 'package:bta3_physia/app/routes/screen_routes/app_routes.dart';
import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() => setupServiceLocator());

  Future<void> pumpApp(WidgetTester tester, {required String route}) async {
    tester.view.physicalSize = const Size(1170, 2532);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) => MaterialApp(
          onGenerateRoute: AppRoutes.generateRoute,
          initialRoute: route,
        ),
      ),
    );

    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 400)),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
  }

  Finder fieldAt(int index) => find.byType(TextFormField).at(index);

  Future<void> tapVisible(WidgetTester tester, Finder finder) async {
    await tester.ensureVisible(finder);
    await tester.pump();
    await tester.tap(finder);
    await tester.pump();
  }

  Future<void> fillDetails(WidgetTester tester) async {
    await tester.enterText(fieldAt(0), 'محمود مجدي');
    await tester.enterText(fieldAt(1), 'student@bta3.com');
    await tester.enterText(fieldAt(2), '01012345678');
    await tester.pump();

    await tapVisible(tester, find.text('متابعة'));
    await tester.pumpAndSettle();
  }

  group('Login', () {
    testWidgets('renders the designed copy', (WidgetTester tester) async {
      await pumpApp(tester, route: RouteNames.loginScreen);

      expect(find.text('هل أنت مستعدّ للبدء؟'), findsOneWidget);
      expect(find.text('سجّل دخولك لبدء رحلة التعلّم.'), findsOneWidget);
      expect(find.text('البريد الإلكتروني'), findsOneWidget);
      expect(find.text('كلمة المرور'), findsOneWidget);
      expect(find.text('تسجيل الدخول'), findsOneWidget);
    });

    testWidgets('an empty submit reports both fields', (
      WidgetTester tester,
    ) async {
      await pumpApp(tester, route: RouteNames.loginScreen);

      await tapVisible(tester, find.text('تسجيل الدخول'));

      expect(find.text('بريدك الإلكتروني مطلوب'), findsOneWidget);
      expect(find.text('كلمة المرور مطلوبة'), findsOneWidget);
    });

    testWidgets('a valid submit lands on the home screen', (
      WidgetTester tester,
    ) async {
      await pumpApp(tester, route: RouteNames.loginScreen);

      await tester.enterText(fieldAt(0), 'student@bta3.com');
      await tester.enterText(fieldAt(1), '123456');
      await tester.pump();

      await tapVisible(tester, find.text('تسجيل الدخول'));
      await tester.pump(const Duration(milliseconds: 700));
      await tester.pumpAndSettle();

      expect(find.text('home screen'), findsOneWidget);
    });

    testWidgets('the register link opens registration', (
      WidgetTester tester,
    ) async {
      await pumpApp(tester, route: RouteNames.loginScreen);

      await tapVisible(tester, find.textContaining('أنشئ حسابًا'));
      await tester.pumpAndSettle();

      expect(find.text('إنشاء حساب جديد'), findsOneWidget);
      expect(find.text('الخطوة ١ من ٣'), findsOneWidget);
    });
  });

  group('Register', () {
    testWidgets('walks the three steps and finishes on home', (
      WidgetTester tester,
    ) async {
      await pumpApp(tester, route: RouteNames.registerScreen);

      // Step 1 — details.
      expect(find.text('إنشاء حساب جديد'), findsOneWidget);
      await fillDetails(tester);

      // Step 2 — grade.
      expect(find.text('ما صفّك الدراسي؟'), findsOneWidget);
      expect(find.text('الخطوة ٢ من ٣'), findsOneWidget);

      await tapVisible(tester, find.text('الصف الثاني الثانوي'));
      await tester.pumpAndSettle();

      await tapVisible(tester, find.text('متابعة'));
      await tester.pumpAndSettle();

      // Step 3 — password.
      expect(find.text('أنشئ كلمة المرور'), findsOneWidget);
      expect(find.text('الخطوة ٣ من ٣'), findsOneWidget);

      await tester.enterText(fieldAt(0), '123456');
      await tester.enterText(fieldAt(1), '123456');
      await tester.pump();

      await tapVisible(tester, find.text('إنشاء الحساب'));
      await tester.pump(const Duration(milliseconds: 700));
      await tester.pumpAndSettle();

      expect(find.text('home screen'), findsOneWidget);
    });

    testWidgets('going back moves between steps, then leaves the flow', (
      WidgetTester tester,
    ) async {
      await pumpApp(tester, route: RouteNames.loginScreen);

      await tapVisible(tester, find.textContaining('أنشئ حسابًا'));
      await tester.pumpAndSettle();

      await fillDetails(tester);

      // go to step 2.
      await tester.tap(find.byIcon(Icons.arrow_forward));
      await tester.pumpAndSettle();
      expect(find.text('ما صفّك الدراسي؟'), findsOneWidget);

      // Back to step 1.
      await tester.tap(find.byIcon(Icons.arrow_forward_ios));
      await tester.pump();
      expect(find.text('إنشاء حساب جديد'), findsOneWidget);

      // Back out of registration, onto login.
      await tester.tap(find.byIcon(Icons.arrow_forward_ios));
      await tester.pump();
      expect(find.text('هل أنت مستعدّ للبدء؟'), findsOneWidget);
    });

    testWidgets('choosing no grade blocks step 2', (WidgetTester tester) async {
      await pumpApp(tester, route: RouteNames.registerScreen);

      await fillDetails(tester);

      await tapVisible(tester, find.text('متابعة'));

      expect(find.text('اختر صفّك الدراسي'), findsOneWidget);
      expect(find.text('ما صفّك الدراسي؟'), findsOneWidget);
    });
  });
}
