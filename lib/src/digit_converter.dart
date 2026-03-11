/// Utilities for converting digits between English and Bangla.
library;

import 'constants.dart';

/// Converts English digit characters to Bangla digit characters.
///
/// Non-digit characters are preserved as-is.
///
/// ```dart
/// toBanglaDigits('12345'); // '১২৩৪৫'
/// toBanglaDigits('1,250.75'); // '১,২৫০.৭৫'
/// ```
String toBanglaDigits(String input) {
  final buffer = StringBuffer();
  for (final char in input.split('')) {
    buffer.write(englishToBanglaDigitMap[char] ?? char);
  }
  return buffer.toString();
}

/// Converts Bangla digit characters to English digit characters.
///
/// Non-digit characters are preserved as-is.
///
/// ```dart
/// toEnglishDigits('১২৩৪৫'); // '12345'
/// ```
String toEnglishDigits(String input) {
  final buffer = StringBuffer();
  for (final char in input.split('')) {
    buffer.write(banglaToEnglishDigitMap[char] ?? char);
  }
  return buffer.toString();
}
