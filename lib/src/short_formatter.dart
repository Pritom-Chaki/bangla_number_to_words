/// Formats large numbers into short Bangla format (হাজার, লক্ষ, কোটি).
library;

import 'digit_converter.dart';

/// Converts a number into a short Bangla format string.
///
/// Uses Bangladeshi units:
/// - কোটি (10,000,000+)
/// - লক্ষ (100,000+)
/// - হাজার (1,000+)
///
/// The result uses Bangla digits with one decimal place.
///
/// ```dart
/// shortFormat(1200);      // '১.২ হাজার'
/// shortFormat(150000);    // '১.৫ লক্ষ'
/// shortFormat(12000000);  // '১.২ কোটি'
/// shortFormat(500);       // '৫০০'
/// ```
String shortFormat(num value) {
  final absValue = value.abs().toDouble();

  String formatted;

  if (absValue >= 10000000) {
    // কোটি
    final result = absValue / 10000000;
    formatted = '${_formatDecimal(result)} কোটি';
  } else if (absValue >= 100000) {
    // লক্ষ
    final result = absValue / 100000;
    formatted = '${_formatDecimal(result)} লক্ষ';
  } else if (absValue >= 1000) {
    // হাজার
    final result = absValue / 1000;
    formatted = '${_formatDecimal(result)} হাজার';
  } else {
    // No unit needed — just convert digits
    formatted = toBanglaDigits(value is int ? value.toString() : absValue.toStringAsFixed(0));
  }

  if (value < 0) {
    return '-$formatted';
  }

  return formatted;
}

/// Formats a double to one decimal place, removing trailing `.০`.
String _formatDecimal(double value) {
  final str = value.toStringAsFixed(1);
  final bangla = toBanglaDigits(str);
  // Remove trailing .০ for clean whole numbers
  if (bangla.endsWith('.০') || bangla.endsWith('।০')) {
    return bangla.substring(0, bangla.length - 2);
  }
  return bangla;
}
