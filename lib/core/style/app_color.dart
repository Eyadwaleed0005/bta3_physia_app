import 'package:flutter/material.dart';

class ColorPalette {
  const ColorPalette._();

  // Primary Teal Colors
  static const Color teal50 = Color(0xFFE8F8F8);
  static const Color teal100 = Color(0xFFB8D9D7);
  static const Color teal200 = Color(0xFF4BC7D8);
  static const Color teal300 = Color(0xFF28767C);
  static const Color teal400 = Color(0xFF124248);
  static const Color teal500 = Color(0xFF0B2B28);
  static const Color teal600 = Color(0xFF051F20);
  static const Color teal700 = Color(0xFF00545F);

  // Lime/Accent Colors
  static const Color lime50 = Color(0xFFF8FFF0);
  static const Color lime100 = Color(0xFFE8FFD0);
  static const Color lime200 = Color(0xFFD6FB00);
  static const Color lime300 = Color(0xFFB8E000);
  static const Color lime400 = Color(0xFF9ACC00);
  static const Color lime500 = Color(0xFF7A9E00);

  // Cyan / Corona Colors
  static const Color cyan50 = Color(0xFFF0FFFF);
  static const Color cyan100 = Color(0xFFBFF0FF);
  static const Color cyan200 = Color(0xFFA6F2FF);
  static const Color cyan300 = Color(0xFF69DEFF);

  static const Color orange300 = Color(0xFFFF9354);

  // Neutral Colors
  static const Color white = Color(0xFFF8F8FF);
  static const Color gray50 = Color(0xFFF5F5F5);
  static const Color gray100 = Color(0xFFE8E8E8);
  static const Color gray200 = Color(0xFFD0D0D0);
  static const Color gray300 = Color(0xFFB0B0B0);
  static const Color gray400 = Color(0xFF909090);
  static const Color gray500 = Color(0xFF707070);
  static const Color gray600 = Color(0xFF505050);
  static const Color gray700 = Color(0xFF303030);
  static const Color gray800 = Color(0xFF202020);
  static const Color gray900 = Color(0xFF101010);
  static const Color black = Color(0xFF000000);

  // Background & Surface
  static const Color surface = Color(0xFFFFFFFF);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color cardFill = Color(0xFFF0FAFA);
  static const Color cardShadow = Color(0x0A051F20);
  static const Color canvas = Color(0xFFF8F8FF);
  static const Color background = canvas;

  // Primary Brand Colors
  static const Color primary = teal600; // #051F20
  static const Color primaryHover = teal500; // #00545F
  static const Color primaryPressed = teal700; // darker
  static const Color primarySoftBackground = teal50; // #E8F8F8
  static const Color deepSurface = teal700;

  // Accent Colors
  static const Color accent = lime200; // #D6FB00
  static const Color highlight = lime200;
  static const Color limeHighlight = lime200;
  static const Color limeLight = lime100;
  static const Color limePale = lime50;

  // Border & Divider
  static const Color border = Color(0xFF28767C);
  static const Color borderWarm = teal200;
  static const Color divider = teal100;
  static const Color dividerWarm = teal100;

  // Text Color Tokens
  static const Color textPrimary = Color(0xFF051F20); // teal600
  static const Color textDark = textPrimary;
  static const Color textSecondary = Color(0xFF4BC7D8); // teal200
  static const Color textMuted = Color(0xFFB8D9D7); // teal100
  static const Color textLight = Color(0xFFF8F8FF); // white
  static const Color textHighLight = lime200; // #D6FB00
  static const Color textBlack = textPrimary;

  static const Color success = Color(0xFF28767C); // teal300
  static const Color cardFillSoft = Color(0xFFF0FAFA);

  static const Color error = Color(0xFFE53E3E);
  static const Color textRed = error;

  // Secondary & Navigation & State
  static const Color secondary = Color(0xFF00545F); // teal700
  static const Color oceanBlue = Color(0xFF00545F);
  static const Color textOceanBlue = oceanBlue;
  static const Color warning = Color(0xFFF6AD55);
  static const Color info = oceanBlue;
  static const Color disabled = Color(0xFFB8D9D7); // teal100
  static const Color crimsonDeep = error;
  static const Color crimsonDark = Color(0xFFC53030);
  static const Color crimsonHover = Color(0xFFFC8181);
  static const Color palePink = Color(0xFFFFF5F5);
  static const Color softRose = Color(0xFFFEEDF0);
  static const Color paleRose = Color(0xFFFFF5F5);
  static const Color creamWhite = Color(0xFFF8F8FF);
  static const Color warmBeige = Color(0xFFF0FAFA);
  static const Color lightCream = Color(0xFFF8F8FF);
  static const Color dustyRose = teal100;
  static const Color mutedTeal = textSecondary;
  static const Color lightGrayWarm = teal100;
  static const Color textSoftSaga = teal100;
  static const Color paleSage = teal50;
  static const Color softSage = teal100;
  static const Color paleMint = teal50;

  // Screen background — #051F20 on 43 of 44 screens.
  static const Color screenBackground = teal600;

  // Two screens intentionally differ, plus the animated Splash gradient.
  static const Color screenBackgroundAlt =
      teal500; // #0B2B28 · "Simple Pendulum"
  static const Color screenBackgroundDeep = teal700; // #00545F · "Progress"

  // Glass / panel surface — #124248, 157 uses ("Glass / Envelope", cards).
  static const Color panelGlass = teal400;
  // Wave / transition fill — #0B2B28, 146 uses ("Transition / color wave").
  static const Color transitionFill = teal500;

  // Input fields — fill #0B2B28 with a #28767C stroke (all Register + Auth fields).
  static const Color fieldFill = teal500;
  static const Color fieldBorder = teal300;

  // Accent + state
  static const Color corona = cyan300; // #69DEFF · arc/curve strokes, 518 uses
  static const Color requiredAnswer = orange300; // #FF9354 · "Required answer"

  // Home indicator bar — #B8D9D7.
  static const Color homeIndicator = teal100;

  static const Color wine200 = teal200; // #4BC7D8 · was a rose tone
  static const Color wine600 = teal600; // #051F20 · was a deep maroon
  static const Color gold300 =
      lime200; // #D6FB00 · was gold, now the lime accent
  static const Color cream50 = white; // #F8F8FF · was cream, now off-white

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [teal500, teal600],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [lime200, lime300],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
