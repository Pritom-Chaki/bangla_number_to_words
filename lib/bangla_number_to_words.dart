/// A pure Dart package to convert numbers and currency amounts into Bangla words
/// using the Bangladeshi numbering system (শত, হাজার, লক্ষ, কোটি).
///
/// ## Features
/// - Convert integers to Bangla words
/// - Convert money amounts to Bangla words with currency labels
/// - Decimal / paisa support for BDT
/// - Short number formatting (হাজার, লক্ষ, কোটি)
/// - Multi-currency support (BDT, USD, EUR, GBP, INR)
/// - Bangla ↔ English digit conversion
///
/// ## Usage
/// ```dart
/// import 'package:bangla_number_to_words/bangla_number_to_words.dart';
///
/// // Number to Bangla words
/// BanglaNumberToWords.convertNumber(1234);
/// // → 'এক হাজার দুইশ চৌত্রিশ'
///
/// // Money with currency
/// BanglaNumberToWords.convertMoney(1250);
/// // → 'এক হাজার দুইশ পঞ্চাশ টাকা'
///
/// // Short format
/// BanglaNumberToWords.shortFormat(12000000);
/// // → '১.২ কোটি'
/// ```
library;

import 'src/constants.dart';
import 'src/digit_converter.dart' as digit;
import 'src/money_converter.dart' as money;
import 'src/number_converter.dart' as number;
import 'src/short_formatter.dart' as short_fmt;

export 'src/constants.dart' show Currency;

/// Main API class for converting numbers and currency amounts into Bangla words.
///
/// All methods are static — no instantiation required.
class BanglaNumberToWords {
  BanglaNumberToWords._();

  /// Converts an integer [value] into Bangla words.
  ///
  /// ```dart
  /// BanglaNumberToWords.convertNumber(123);
  /// // → 'একশ তেইশ'
  ///
  /// BanglaNumberToWords.convertNumber(12345678);
  /// // → 'এক কোটি তেইশ লক্ষ পঁয়তাল্লিশ হাজার ছয়শ আটাত্তর'
  /// ```
  static String convertNumber(num value) => number.convertNumber(value);

  /// Converts a monetary [amount] into Bangla words with a currency label.
  ///
  /// - [currency] defaults to [Currency.bdt] (টাকা).
  /// - [addOnly] appends "মাত্র" when `true`.
  /// - Decimal values are converted to পয়সা for BDT.
  ///
  /// ```dart
  /// BanglaNumberToWords.convertMoney(1250);
  /// // → 'এক হাজার দুইশ পঞ্চাশ টাকা'
  ///
  /// BanglaNumberToWords.convertMoney(125.50);
  /// // → 'একশ পঁচিশ টাকা পঞ্চাশ পয়সা'
  ///
  /// BanglaNumberToWords.convertMoney(125, currency: Currency.usd);
  /// // → 'একশ পঁচিশ ডলার'
  /// ```
  static String convertMoney(
    num amount, {
    Currency currency = Currency.bdt,
    bool addOnly = false,
  }) =>
      money.convertMoney(amount, currency: currency, addOnly: addOnly);

  /// Formats a large number into a short Bangla representation.
  ///
  /// ```dart
  /// BanglaNumberToWords.shortFormat(1200);      // '১.২ হাজার'
  /// BanglaNumberToWords.shortFormat(150000);     // '১.৫ লক্ষ'
  /// BanglaNumberToWords.shortFormat(12000000);   // '১.২ কোটি'
  /// ```
  static String shortFormat(num value) => short_fmt.shortFormat(value);

  /// Converts English digit characters to Bangla digit characters.
  ///
  /// ```dart
  /// BanglaNumberToWords.toBanglaDigits('12345'); // '১২৩৪৫'
  /// ```
  static String toBanglaDigits(String input) => digit.toBanglaDigits(input);

  /// Converts Bangla digit characters to English digit characters.
  ///
  /// ```dart
  /// BanglaNumberToWords.toEnglishDigits('১২৩৪৫'); // '12345'
  /// ```
  static String toEnglishDigits(String input) => digit.toEnglishDigits(input);
}
