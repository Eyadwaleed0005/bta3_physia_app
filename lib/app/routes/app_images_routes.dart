class AppImage {
  static AppImage? _instance;

  factory AppImage() {
    _instance ??= AppImage._internal();
    return _instance!;
  }

  AppImage._internal();

  // Base paths
  final String baseImages = 'assets/images/';
  final String baseIcons = 'assets/icons/';
  final String baseAnimations = 'assets/animations/';

  // ===== images =====
  late final String wordMark = '${baseImages}wordmark.svg';
  late final String surgeTop = '${baseImages}surge_top.svg';
  late final String surgeRight = '${baseImages}surge_right.svg';
  late final String surgeBottom = '${baseImages}surge_bottom.svg';
  late final String surgeLeft = '${baseImages}surge_left.svg';
  late final String courseBanner = '${baseImages}course_banner.png';
  //late final String courseBannerSvg = '${baseImages}course_banner.svg';

  // ===== icons =====
  late final String rocketIcon = '${baseIcons}Rocket.svg';
  late final String arrowBack = '${baseIcons}arrow_back.svg';
  late final String home = '${baseIcons}home.svg';
  late final String live = '${baseIcons}live.svg';
  late final String book = '${baseIcons}book.svg';
  late final String chart = '${baseIcons}chart.svg';
  late final String blueChart = '${baseIcons}chart_blue.svg';
  late final String user = '${baseIcons}user.svg';
  late final String blueLive = '${baseIcons}live_blue.svg';
  late final String category = '${baseIcons}category.svg';
  late final String blueBook = '${baseIcons}book_blue.svg';
  late final String blueExam = '${baseIcons}exam_blue.svg';

  // ===== animations =====
  late final String splash = '${baseAnimations}splash.json';
  late final String onboardingBulb1 = '${baseAnimations}Onboarding_bulb_1.json';
  late final String onboardingGrowingColumns3 =
      '${baseAnimations}Onboarding_Growing_columns_3.json';
  late final String electricBackground =
      '${baseAnimations}Ambient___Electric_background.json';
}
