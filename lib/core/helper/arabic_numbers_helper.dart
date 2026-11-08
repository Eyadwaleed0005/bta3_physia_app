const String _westernDigits = '0123456789';
const String _arabicDigits = '٠١٢٣٤٥٦٧٨٩';

String toArabicNumbers(num number) => toArabicDigits(number.toString());

/// Converts western digits inside [value] to Arabic-Indic ones, character by
/// character. Every non-digit character is kept as it is, which means padding
/// and separators survive: `'05'` becomes `'٠٥'`, not `'٥'`.
String toArabicDigits(String value) {
  return value.split('').map((character) {
    final index = _westernDigits.indexOf(character);

    if (index == -1) {
      return character;
    }

    return _arabicDigits[index];
  }).join();
}
