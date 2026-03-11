/// Core logic for converting numbers into Bangla words
/// using the Bangladeshi numbering system.
library;

import 'constants.dart';

/// Converts a non-negative integer into Bangla words.
///
/// Uses the Bangladeshi grouping system:
/// - শত (hundreds)
/// - হাজার (thousands)
/// - লক্ষ (lakhs — groups of 2 digits after thousands)
/// - কোটি (crores — groups of 2 digits after lakhs)
///
/// ```dart
/// convertNumber(0);        // 'শূন্য'
/// convertNumber(123);      // 'একশ তেইশ'
/// convertNumber(1234);     // 'এক হাজার দুইশ চৌত্রিশ'
/// convertNumber(12345678); // 'এক কোটি তেইশ লক্ষ পঁয়তাল্লিশ হাজার ছয়শ আটাত্তর'
/// ```
String convertNumber(num value) {
  final intValue = value.toInt();

  if (intValue < 0) {
    return 'মাইনাস ${convertNumber(-intValue)}';
  }

  if (intValue <= 100) {
    return banglaOnes[intValue]!;
  }

  final parts = <String>[];

  // Break the number into Bangladeshi groups:
  // ones+tens (2 digits), hundreds (1 digit), thousands (2 digits),
  // lakhs (2 digits), crores (repeating 2-digit groups).
  var remaining = intValue;

  // Extract the last two digits (ones and tens)
  final onesTens = remaining % 100;
  remaining ~/= 100;

  // Extract hundreds digit
  final hundreds = remaining % 10;
  remaining ~/= 10;

  // Extract thousands (2 digits)
  final thousands = remaining % 100;
  remaining ~/= 100;

  // Extract lakhs (2 digits)
  final lakhs = remaining % 100;
  remaining ~/= 100;

  // Remaining is crores — process in 2-digit groups
  // We need to recursively handle crores for very large numbers
  if (remaining > 0) {
    parts.add('${_convertCroresPart(remaining)} কোটি');
  }

  if (lakhs > 0) {
    parts.add('${banglaOnes[lakhs]!} লক্ষ');
  }

  if (thousands > 0) {
    parts.add('${banglaOnes[thousands]!} হাজার');
  }

  if (hundreds > 0) {
    parts.add('${banglaOnes[hundreds]!}শ');
  }

  if (onesTens > 0) {
    parts.add(banglaOnes[onesTens]!);
  }

  return parts.join(' ');
}

/// Recursively converts the crore portion of a number.
///
/// For numbers >= 100 crore, this produces nested crore expressions
/// like "একশ কোটি" or "এক হাজার কোটি".
String _convertCroresPart(int crores) {
  if (crores <= 100) {
    return banglaOnes[crores]!;
  }

  // For values > 100, apply the same Bangladeshi grouping within crores
  final parts = <String>[];
  var remaining = crores;

  final onesTens = remaining % 100;
  remaining ~/= 100;

  final hundreds = remaining % 10;
  remaining ~/= 10;

  final thousands = remaining % 100;
  remaining ~/= 100;

  final lakhs = remaining % 100;
  remaining ~/= 100;

  if (remaining > 0) {
    parts.add('${_convertCroresPart(remaining)} কোটি');
  }

  if (lakhs > 0) {
    parts.add('${banglaOnes[lakhs]!} লক্ষ');
  }

  if (thousands > 0) {
    parts.add('${banglaOnes[thousands]!} হাজার');
  }

  if (hundreds > 0) {
    parts.add('${banglaOnes[hundreds]!}শ');
  }

  if (onesTens > 0) {
    parts.add(banglaOnes[onesTens]!);
  }

  return parts.join(' ');
}
