import 'package:bta3_physia/core/helper/arabic_numbers_helper.dart';

String formatRemainingTime(Duration remaining) {
  final totalSeconds = remaining.inSeconds < 0 ? 0 : remaining.inSeconds;
  final minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
  final seconds = (totalSeconds % 60).toString().padLeft(2, '0');

  return '${toArabicDigits(seconds)} : ${toArabicDigits(minutes)}';
}
