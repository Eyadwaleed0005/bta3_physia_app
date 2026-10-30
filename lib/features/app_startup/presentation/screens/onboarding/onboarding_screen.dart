import 'package:bta3_physia/app/routes/screen_routes/route_names.dart';
import 'package:bta3_physia/core/helper/spacer.dart';
import 'package:bta3_physia/features/app_startup/model/onboarding_model.dart';
import 'package:bta3_physia/features/app_startup/presentation/widgets/onboarding_widgets/next_button.dart';
import 'package:bta3_physia/features/app_startup/presentation/widgets/onboarding_widgets/onboarding_page.dart';
import 'package:bta3_physia/features/app_startup/presentation/widgets/onboarding_widgets/rocket_veil.dart';
import 'package:bta3_physia/features/app_startup/presentation/widgets/onboarding_widgets/step_indicator.dart';
import 'package:bta3_physia/features/app_startup/presentation/widgets/onboarding_widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  static const Duration _transitionDuration = Duration(milliseconds: 1400);

  static const double _kCollapseEnd = 0.14; // collapse of button
  static const double _kRocketInEnd = 0.28; // speed of rocket
  static const double _kRiseEnd =
      0.68; // speed of rocket and the screen to rise up
  static const double _kVeilFadeStart = 0.70; // displayed of screen
  static const double _kVeilFadeEnd = 0.88; // undisplayed of screen

  final PageController _controller = PageController();

  late final AnimationController _transition =
      AnimationController(vsync: this, duration: _transitionDuration)
        ..addListener(_onTransitionTick)
        ..addStatusListener(_onTransitionStatus);

  late final Animation<double> _buttonScale = TweenSequence<double>(
    <TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(
          begin: 1,
          end: 0,
        ).chain(CurveTween(curve: Curves.easeInCubic)),
        weight: 14,
      ),
      TweenSequenceItem<double>(tween: ConstantTween<double>(0), weight: 40),
      TweenSequenceItem<double>(
        tween: Tween<double>(
          begin: 0,
          end: 1,
        ).chain(CurveTween(curve: Curves.easeOutCubic)),
        weight: 12,
      ),
      TweenSequenceItem<double>(tween: ConstantTween<double>(1), weight: 34),
    ],
  ).animate(_transition);

  //rocket appear animation
  late final Animation<double> _rocketAppear = CurvedAnimation(
    parent: _transition,
    curve: const Interval(
      _kCollapseEnd,
      _kRocketInEnd,
      curve: Curves.easeOutBack,
    ),
  );

  //rocket fade animation
  late final Animation<double> _rocketFade = CurvedAnimation(
    parent: _transition,
    curve: const Interval(_kCollapseEnd, 0.24, curve: Curves.easeOut),
  );

  /// 0 -> 1 as the screen travels from the bottom edge to the top of the screen.
  late final Animation<double> _rise = CurvedAnimation(
    parent: _transition,
    curve: const Interval(
      _kRocketInEnd,
      _kRiseEnd,
      curve: Curves.easeInOutCubic,
    ),
  );

  /// 0 -> 1 as the screen dissappears once the page has been swapped successfully.
  late final Animation<double> _veilFade = CurvedAnimation(
    parent: _transition,
    curve: const Interval(
      _kVeilFadeStart,
      _kVeilFadeEnd,
      curve: Curves.easeOut,
    ),
  );

  int? _incoming;

  bool _running = false;

  bool _swapped = false;

  int _index = 0;

  @override
  void dispose() {
    _transition.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onNext() {
    if (_running) {
      return;
    }
    final bool isLast = _index == onboardingPages.length - 1;

    setState(() {
      _running = true;
      _incoming = isLast ? null : _index + 1;
      _swapped = false;
    });
    _transition.forward(from: 0);
  }

  void _onSkip() {
    if (_running) {
      return;
    }
    Navigator.of(context).pushReplacementNamed(RouteNames.loginScreen);
  }

  void _onFinish() {
    Navigator.of(context).pushReplacementNamed(RouteNames.loginScreen);
  }

  void _onTransitionTick() {
    if (_swapped || !_running || _transition.value < _kRiseEnd) {
      return;
    }
    _swapped = true;
    final int? next = _incoming;
    if (next == null) {
      _onFinish();
      return;
    }
    setState(() => _index = next);
    if (_controller.hasClients) {
      _controller.jumpToPage(next);
    }
  }

  void _onTransitionStatus(AnimationStatus status) {
    if (status != AnimationStatus.completed || !mounted) {
      return;
    }
    setState(() {
      _running = false;
      _incoming = null;
    });
    _transition.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned.fill(
              child: ColoredBox(color: onboardingPages[_index].background),
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
                child: Column(
                  children: [
                    verticalSpace(6),
                    TopBar(onSkip: _onSkip, enabled: !_running),
                    verticalSpace(20),
                    Expanded(
                      child: PageView.builder(
                        controller: _controller,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: onboardingPages.length,
                        itemBuilder: (BuildContext context, int index) =>
                            OnboardingPage(
                              page: onboardingPages[index],
                              isActive: _index == index,
                            ),
                      ),
                    ),
                    verticalSpace(20),
                    StepIndicator(index: _index),
                    verticalSpace(24),
                    IgnorePointer(
                      ignoring: _running,
                      child: NextButton(
                        label: onboardingPages[_index].buttonLabel,
                        scale: _buttonScale,
                        onPressed: _onNext,
                      ),
                    ),
                    verticalSpace(12),
                  ],
                ),
              ),
            ),
            if (_running)
              Positioned.fill(
                child: IgnorePointer(
                  child: RocketVeil(
                    color: onboardingPages[_incoming ?? _index].background,
                    rise: _rise,
                    rocketAppear: _rocketAppear,
                    rocketFade: _rocketFade,
                    veilFade: _veilFade,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
