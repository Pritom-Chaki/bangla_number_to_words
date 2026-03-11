/// Converts currency amounts into Bangla words with currency labels.
library;

import 'constants.dart';
import 'number_converter.dart';

/// Converts a monetary [amount] into Bangla words.
///
/// - [currency] specifies the currency type (default: [Currency.bdt]).
/// - [addOnly] appends "মাত্র" at the end when `true`.
///
/// For decimal amounts with [Currency.bdt], the fractional part is
/// converted as পয়সা (paisa). For other currencies, decimals are
/// ignored and the amount is rounded.
///
/// ```dart
/// convertMoney(1250);
/// // 'এক হাজার দুইশ পঞ্চাশ টাকা'
///
/// convertMoney(1250, addOnly: true);
/// // 'এক হাজার দুইশ পঞ্চাশ টাকা মাত্র'
///
/// convertMoney(125.50);
/// // 'একশ পঁচিশ টাকা পঞ্চাশ পয়সা'
///
/// convertMoney(125, currency: Currency.usd);
/// // 'একশ পঁচিশ ডলার'
/// ```
String convertMoney(
  num amount, {
  Currency currency = Currency.bdt,
  bool addOnly = false,
}) {
  final currencyLabel = currencyLabels[currency]!;

  // Split into integer and decimal parts
  final integerPart = amount.toInt();
  final decimalPart = _extractDecimalPart(amount);

  final parts = <String>[];

  // Convert the integer part
  if (integerPart == 0 && decimalPart == 0) {
    parts.add('${convertNumber(0)} $currencyLabel');
  } else if (integerPart > 0) {
    parts.add('${convertNumber(integerPart)} $currencyLabel');
  }

  // Convert the decimal part as paisa (only for BDT)
  if (decimalPart > 0 && currency == Currency.bdt) {
    parts.add('${convertNumber(decimalPart)} $paisaLabel');
  }

  // Handle non-BDT with decimal — just use integer part
  if (decimalPart > 0 && currency != Currency.bdt && integerPart == 0) {
    parts.add('${convertNumber(0)} $currencyLabel');
  }

  final result = parts.join(' ');

  if (addOnly) {
    return '$result $onlyLabel';
  }

  return result;
}

/// Extracts the decimal portion as an integer (max 2 digits for paisa).
///
/// For example, 125.50 → 50, 1000.75 → 75, 99.5 → 50.
int _extractDecimalPart(num amount) {
  // Use string manipulation to avoid floating-point precision issues
  final str = amount.toString();
  final dotIndex = str.indexOf('.');
  if (dotIndex == -1) return 0;

  var decimalStr = str.substring(dotIndex + 1);

  // Pad to 2 digits or truncate to 2 digits
  if (decimalStr.length == 1) {
    decimalStr = '${decimalStr}0';
  } else if (decimalStr.length > 2) {
    decimalStr = decimalStr.substring(0, 2);
  }

  return int.parse(decimalStr);
}
