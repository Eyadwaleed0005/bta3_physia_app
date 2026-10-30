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

  // ===== icons =====
  late final String rocketIcon = '${baseIcons}Rocket.svg';
  late final String arrowBack = '${baseIcons}arrow_back.svg';
}
