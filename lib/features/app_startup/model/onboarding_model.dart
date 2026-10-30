import 'package:bta3_physia/core/style/app_color.dart';
import 'package:flutter/material.dart';

class OnboardingModel {
  const OnboardingModel({
    required this.animation,
    required this.background,
    required this.caption,
    required this.captionColor,
    required this.heading,
    required this.supporting,
    required this.buttonLabel,
    this.eyebrow,
  });

  final String animation;

  final Color background;

  final String caption;
  final Color captionColor;

  final String? eyebrow;

  final String heading;
  final String supporting;

  final String buttonLabel;
}

const List<OnboardingModel> onboardingPages = <OnboardingModel>[
  OnboardingModel(
    animation: 'assets/animations/Onboarding_bulb_1.json',
    background: ColorPalette.screenBackground,
    caption: 'جمال محمد — بتاع فيزيا',
    captionColor: ColorPalette.textSecondary,
    eyebrow: 'مرحبًا بك في بتاع فيزيا',
    heading: 'الفيزياء أبسط\nممّا تتخيّل.',
    supporting:
        'افهم الفيزياء والعلوم المتكاملة\nمع الأستاذ جمال محمد، خطوةً بخطوة.',
    buttonLabel: 'التالي',
  ),
  OnboardingModel(
    animation: 'assets/animations/Onboarding_bulb_1.json',
    background: ColorPalette.screenBackgroundAlt,
    caption: 'تجربة البندول البسيط',
    captionColor: ColorPalette.textSecondary,
    eyebrow: 'الفيزياء أمام عينيك',
    heading: 'شاهد التجربة.\nوافهم الفكرة.',
    supporting: 'تأمّل حركة البندول البسيط،\nوافهم مبادئه خطوةً بخطوة.',
    buttonLabel: 'التالي',
  ),
  OnboardingModel(
    animation: 'assets/animations/Onboarding_Growing_columns_3.json',
    background: ColorPalette.screenBackgroundDeep,
    caption: 'تعرّف على مستواك، وتقدّم بثقة.',
    captionColor: ColorPalette.textHighLight,
    heading: 'كل خطوة تُحدث فرقًا.\nتابع تقدّمك.',
    supporting:
        'راجع إجاباتك ونتائج اختباراتك،\nوحدّد ما يحتاج إلى مزيد من التركيز.',
    buttonLabel: 'ابدأ رحلتك',
  ),
];
