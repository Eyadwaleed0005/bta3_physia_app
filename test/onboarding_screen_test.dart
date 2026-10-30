import 'package:bta3_physia/app/routes/screen_routes/app_routes.dart';
import 'package:bta3_physia/features/app_startup/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  /// Pumps the screen at the Figma frame size (390x844 @3x) so that overflow
  /// and asset problems surface the same way they would on a phone.
  Future<void> pumpOnboarding(WidgetTester tester) async {
    tester.view.physicalSize = const Size(1170, 2532);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) => MaterialApp(
          // Skip pushes the login route by name.
          onGenerateRoute: AppRoutes.generateRoute,
          home: const OnboardingScreen(),
        ),
      ),
    );

    // Lottie and the wordmark SVG load off the fake-async path.
    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 400)),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
  }

  /// The visible Lottie repeats forever, so `pumpAndSettle` would time out.
  /// The rocket timeline runs for 1400ms; pump past the swap and past the end.
  Future<void> settlePageChange(WidgetTester tester) async {
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 1000));
    await tester.pump(const Duration(milliseconds: 500));
  }

  testWidgets('renders page 1 without layout or asset errors', (
    WidgetTester tester,
  ) async {
    await pumpOnboarding(tester);

    expect(find.text('الفيزياء أبسط\nممّا تتخيّل.'), findsOneWidget);
    expect(find.text('مرحبًا بك في بتاع فيزيا'), findsOneWidget);
    expect(find.text('تخطي'), findsOneWidget);
    expect(find.text('التالي'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('paging through swaps copy and re-labels the button', (
    WidgetTester tester,
  ) async {
    await pumpOnboarding(tester);

    await tester.tap(find.text('التالي'));
    await settlePageChange(tester);
    expect(find.text('شاهد التجربة.\nوافهم الفكرة.'), findsOneWidget);
    expect(find.text('تجربة البندول البسيط'), findsOneWidget);

    await tester.tap(find.text('التالي'));
    await settlePageChange(tester);
    expect(find.text('كل خطوة تُحدث فرقًا.\nتابع تقدّمك.'), findsOneWidget);
    expect(find.text('ابدأ رحلتك'), findsOneWidget);

    // Last page has no eyebrow, so the first page's must be gone.
    expect(find.text('مرحبًا بك في بتاع فيزيا'), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('swiping does not move between pages', (
    WidgetTester tester,
  ) async {
    await pumpOnboarding(tester);

    await tester.drag(find.byType(PageView), const Offset(-320, 0));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));

    // Still on page 1 — the button is the only way forward.
    expect(find.text('الفيزياء أبسط\nممّا تتخيّل.'), findsOneWidget);
    expect(find.text('التالي'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('skip replaces onboarding with the login screen', (
    WidgetTester tester,
  ) async {
    await pumpOnboarding(tester);

    expect(find.text('تخطي'), findsOneWidget);
    await tester.tap(find.text('تخطي'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 700));

    expect(find.text('تسجيل الدخول'), findsOneWidget);
    expect(find.text('تخطي'), findsNothing);
    expect(tester.takeException(), isNull);
  });
}
