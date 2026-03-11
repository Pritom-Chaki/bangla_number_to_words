# bangla_number_to_words

A pure Dart package to convert numbers and currency amounts into Bangla words using the Bangladeshi numbering system (শত, হাজার, লক্ষ, কোটি).

## Features

- **Number to Bangla Words** — Convert integers into Bangla text
- **Money to Bangla Words** — Convert currency amounts with টাকা, পয়সা
- **"মাত্র" Support** — Optionally append "মাত্র" (only) to money text
- **Decimal / Paisa** — Convert decimal amounts into টাকা + পয়সা
- **Short Format** — Format large numbers as হাজার, লক্ষ, কোটি
- **Multi-Currency** — BDT, USD, EUR, GBP, INR
- **Digit Conversion** — Convert between English and Bangla digits

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  bangla_number_to_words: ^1.0.0
```

## Usage

```dart
import 'package:bangla_number_to_words/bangla_number_to_words.dart';

// Number to Bangla words
BanglaNumberToWords.convertNumber(123);
// → একশ তেইশ

BanglaNumberToWords.convertNumber(1234);
// → এক হাজার দুইশ চৌত্রিশ

BanglaNumberToWords.convertNumber(12345678);
// → এক কোটি তেইশ লক্ষ পঁয়তাল্লিশ হাজার ছয়শ আটাত্তর

// Money to Bangla words
BanglaNumberToWords.convertMoney(1250);
// → এক হাজার দুইশ পঞ্চাশ টাকা

// Money with মাত্র
BanglaNumberToWords.convertMoney(1250, addOnly: true);
// → এক হাজার দুইশ পঞ্চাশ টাকা মাত্র

// Decimal / Paisa support
BanglaNumberToWords.convertMoney(125.50);
// → একশ পঁচিশ টাকা পঞ্চাশ পয়সা

BanglaNumberToWords.convertMoney(1000.75);
// → এক হাজার টাকা পঁচাত্তর পয়সা

// Short format
BanglaNumberToWords.shortFormat(1200);
// → ১.২ হাজার

BanglaNumberToWords.shortFormat(150000);
// → ১.৫ লক্ষ

BanglaNumberToWords.shortFormat(12000000);
// → ১.২ কোটি

// Multi-currency
BanglaNumberToWords.convertMoney(125, currency: Currency.usd);
// → একশ পঁচিশ ডলার

BanglaNumberToWords.convertMoney(125, currency: Currency.eur);
// → একশ পঁচিশ ইউরো

// Digit conversion
BanglaNumberToWords.toBanglaDigits('12345');
// → ১২৩৪৫

BanglaNumberToWords.toEnglishDigits('১২৩৪৫');
// → 12345
```

## Bangladeshi Number System

| Value         | Bangla  |
|---------------|---------|
| 100           | শত      |
| 1,000         | হাজার   |
| 1,00,000      | লক্ষ    |
| 1,00,00,000   | কোটি    |

## Supported Currencies

| Currency | Bangla Label |
|----------|-------------|
| BDT      | টাকা        |
| USD      | ডলার        |
| EUR      | ইউরো        |
| GBP      | পাউন্ড      |
| INR      | রুপি        |

## License

MIT License — see [LICENSE](LICENSE) for details.
