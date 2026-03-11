import 'package:bangla_number_to_words/bangla_number_to_words.dart';

void main() {
  // Number to Bangla words
  print(BanglaNumberToWords.convertNumber(123));
  // একশ তেইশ

  print(BanglaNumberToWords.convertNumber(1234));
  // এক হাজার দুইশ চৌত্রিশ

  print(BanglaNumberToWords.convertNumber(12345678));
  // এক কোটি তেইশ লক্ষ পঁয়তাল্লিশ হাজার ছয়শ আটাত্তর

  // Money to Bangla words
  print(BanglaNumberToWords.convertMoney(1250));
  // এক হাজার দুইশ পঞ্চাশ টাকা

  // Money with মাত্র
  print(BanglaNumberToWords.convertMoney(1250, addOnly: true));
  // এক হাজার দুইশ পঞ্চাশ টাকা মাত্র

  // Decimal / Paisa support
  print(BanglaNumberToWords.convertMoney(125.50));
  // একশ পঁচিশ টাকা পঞ্চাশ পয়সা

  print(BanglaNumberToWords.convertMoney(1000.75));
  // এক হাজার টাকা পঁচাত্তর পয়সা

  // Short format
  print(BanglaNumberToWords.shortFormat(1200));
  // ১.২ হাজার

  print(BanglaNumberToWords.shortFormat(150000));
  // ১.৫ লক্ষ

  print(BanglaNumberToWords.shortFormat(12000000));
  // ১.২ কোটি

  // Multi-currency
  print(BanglaNumberToWords.convertMoney(125, currency: Currency.usd));
  // একশ পঁচিশ ডলার

  print(BanglaNumberToWords.convertMoney(125, currency: Currency.eur));
  // একশ পঁচিশ ইউরো

  // Digit conversion
  print(BanglaNumberToWords.toBanglaDigits('12345'));
  // ১২৩৪৫

  print(BanglaNumberToWords.toEnglishDigits('১২৩৪৫'));
  // 12345
}
