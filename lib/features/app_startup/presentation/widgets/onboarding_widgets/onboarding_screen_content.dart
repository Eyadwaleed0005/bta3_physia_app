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

class OnboardingScreenContent extends StatefulWidget {
  const OnboardingScreenContent({super.key});

  @override
  State<OnboardingScreenContent> createState() =>
      _OnboardingScreenContentState();
}

class _OnboardingScreenContentState extends State<OnboardingScreenContent>
    with SingleTickerProviderStateMixin {
  static const Duration _transitionDuration = Duration(milliseconds: 1400);

  static const double _kCollapseEnd = 0.14;
  static const double _kRocketInEnd = 0.28;
  static const double _kRiseEnd = 0.68;
  static const double _kVeilFadeStart = 0.70;
  static const double _kVeilFadeEnd = 0.88;

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

  late final Animation<double> _rocketAppear = CurvedAnimation(
    parent: _transition,
    curve: const Interval(
      _kCollapseEnd,
      _kRocketInEnd,
      curve: Curves.easeOutBack,
    ),
  );

  late final Animation<double> _rocketFade = CurvedAnimation(
    parent: _transition,
    curve: const Interval(_kCollapseEnd, 0.24, curve: Curves.easeOut),
  );

  late final Animation<double> _rise = CurvedAnimation(
    parent: _transition,
    curve: const Interval(
      _kRocketInEnd,
      _kRiseEnd,
      curve: Curves.easeInOutCubic,
    ),
  );

  Animation<double> _veilFade = kAlwaysDismissedAnimation;

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
    _veilFade = isLast
        ? kAlwaysDismissedAnimation
        : CurvedAnimation(
            parent: _transition,
            curve: const Interval(
              _kVeilFadeStart,
              _kVeilFadeEnd,
              curve: Curves.easeOut,
            ),
          );

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
    Navigator.of(context).pushReplacementNamed(
      RouteNames.loginScreen,
      arguments: {'skipElectricTransition': true},
    );
  }

  void _onFinish() {
    Navigator.of(context).pushReplacementNamed(
      RouteNames.loginScreen,
      arguments: {'skipElectricTransition': true},
    );
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
      child: Stack(
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
                  color: onboardingPages[_incoming ?? 0].background,
                  rise: _rise,
                  rocketAppear: _rocketAppear,
                  rocketFade: _rocketFade,
                  veilFade: _veilFade,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
