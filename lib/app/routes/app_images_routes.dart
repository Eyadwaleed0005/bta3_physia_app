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

  // ===== images =====
  late final String wordMark = '${baseImages}onboarding_wordmark.svg';

  // ===== icons =====
  late final String rocketIcon = '${baseIcons}Rocket.svg';
  late final String arrowBack = '${baseIcons}arrow_back.svg';
  late final String home = '${baseIcons}home.svg';
  late final String live = '${baseIcons}live.svg';
  late final String book = '${baseIcons}book.svg';
  late final String chart = '${baseIcons}chart.svg';
  late final String user = '${baseIcons}user.svg';
}
