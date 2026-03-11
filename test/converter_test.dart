import 'package:bangla_number_to_words/bangla_number_to_words.dart';
import 'package:test/test.dart';

void main() {
  group('convertNumber', () {
    test('converts zero', () {
      expect(BanglaNumberToWords.convertNumber(0), 'শূন্য');
    });

    test('converts single digits', () {
      expect(BanglaNumberToWords.convertNumber(1), 'এক');
      expect(BanglaNumberToWords.convertNumber(5), 'পাঁচ');
      expect(BanglaNumberToWords.convertNumber(9), 'নয়');
    });

    test('converts teens and tens', () {
      expect(BanglaNumberToWords.convertNumber(10), 'দশ');
      expect(BanglaNumberToWords.convertNumber(15), 'পনেরো');
      expect(BanglaNumberToWords.convertNumber(20), 'বিশ');
      expect(BanglaNumberToWords.convertNumber(99), 'নিরানব্বই');
      expect(BanglaNumberToWords.convertNumber(100), 'একশ');
    });

    test('converts hundreds', () {
      expect(BanglaNumberToWords.convertNumber(123), 'একশ তেইশ');
      expect(BanglaNumberToWords.convertNumber(200), 'দুইশ');
      expect(BanglaNumberToWords.convertNumber(505), 'পাঁচশ পাঁচ');
    });

    test('converts thousands', () {
      expect(
        BanglaNumberToWords.convertNumber(1234),
        'এক হাজার দুইশ চৌত্রিশ',
      );
      expect(BanglaNumberToWords.convertNumber(10000), 'দশ হাজার');
      expect(BanglaNumberToWords.convertNumber(99999), 'নিরানব্বই হাজার নয়শ নিরানব্বই');
    });

    test('converts lakhs', () {
      expect(
        BanglaNumberToWords.convertNumber(100000),
        'এক লক্ষ',
      );
      expect(
        BanglaNumberToWords.convertNumber(150000),
        'এক লক্ষ পঞ্চাশ হাজার',
      );
    });

    test('converts crores', () {
      expect(
        BanglaNumberToWords.convertNumber(10000000),
        'এক কোটি',
      );
      expect(
        BanglaNumberToWords.convertNumber(12345678),
        'এক কোটি তেইশ লক্ষ পঁয়তাল্লিশ হাজার ছয়শ আটাত্তর',
      );
    });

    test('converts large numbers with multiple crores', () {
      expect(
        BanglaNumberToWords.convertNumber(100000000),
        'দশ কোটি',
      );
      expect(
        BanglaNumberToWords.convertNumber(1000000000),
        'একশ কোটি',
      );
    });

    test('converts negative numbers', () {
      expect(
        BanglaNumberToWords.convertNumber(-123),
        'মাইনাস একশ তেইশ',
      );
    });
  });

  group('convertMoney', () {
    test('converts basic money amount', () {
      expect(
        BanglaNumberToWords.convertMoney(1250),
        'এক হাজার দুইশ পঞ্চাশ টাকা',
      );
    });

    test('converts money with addOnly', () {
      expect(
        BanglaNumberToWords.convertMoney(1250, addOnly: true),
        'এক হাজার দুইশ পঞ্চাশ টাকা মাত্র',
      );
    });

    test('converts decimal money with paisa', () {
      expect(
        BanglaNumberToWords.convertMoney(125.50),
        'একশ পঁচিশ টাকা পঞ্চাশ পয়সা',
      );
      expect(
        BanglaNumberToWords.convertMoney(1000.75),
        'এক হাজার টাকা পঁচাত্তর পয়সা',
      );
    });

    test('converts zero amount', () {
      expect(
        BanglaNumberToWords.convertMoney(0),
        'শূন্য টাকা',
      );
    });

    test('converts with addOnly and paisa', () {
      expect(
        BanglaNumberToWords.convertMoney(125.50, addOnly: true),
        'একশ পঁচিশ টাকা পঞ্চাশ পয়সা মাত্র',
      );
    });
  });

  group('convertMoney with currencies', () {
    test('converts USD', () {
      expect(
        BanglaNumberToWords.convertMoney(125, currency: Currency.usd),
        'একশ পঁচিশ ডলার',
      );
    });

    test('converts EUR', () {
      expect(
        BanglaNumberToWords.convertMoney(125, currency: Currency.eur),
        'একশ পঁচিশ ইউরো',
      );
    });

    test('converts GBP', () {
      expect(
        BanglaNumberToWords.convertMoney(125, currency: Currency.gbp),
        'একশ পঁচিশ পাউন্ড',
      );
    });

    test('converts INR', () {
      expect(
        BanglaNumberToWords.convertMoney(125, currency: Currency.inr),
        'একশ পঁচিশ রুপি',
      );
    });
  });

  group('shortFormat', () {
    test('formats thousands', () {
      expect(BanglaNumberToWords.shortFormat(1200), '১.২ হাজার');
      expect(BanglaNumberToWords.shortFormat(5000), '৫ হাজার');
    });

    test('formats lakhs', () {
      expect(BanglaNumberToWords.shortFormat(150000), '১.৫ লক্ষ');
      expect(BanglaNumberToWords.shortFormat(100000), '১ লক্ষ');
    });

    test('formats crores', () {
      expect(BanglaNumberToWords.shortFormat(12000000), '১.২ কোটি');
      expect(BanglaNumberToWords.shortFormat(10000000), '১ কোটি');
    });

    test('formats small numbers without unit', () {
      expect(BanglaNumberToWords.shortFormat(500), '৫০০');
      expect(BanglaNumberToWords.shortFormat(99), '৯৯');
    });
  });

  group('toBanglaDigits', () {
    test('converts English digits to Bangla', () {
      expect(BanglaNumberToWords.toBanglaDigits('12345'), '১২৩৪৫');
      expect(BanglaNumberToWords.toBanglaDigits('0'), '০');
    });

    test('preserves non-digit characters', () {
      expect(BanglaNumberToWords.toBanglaDigits('1,250.75'), '১,২৫০.৭৫');
    });
  });

  group('toEnglishDigits', () {
    test('converts Bangla digits to English', () {
      expect(BanglaNumberToWords.toEnglishDigits('১২৩৪৫'), '12345');
      expect(BanglaNumberToWords.toEnglishDigits('০'), '0');
    });

    test('preserves non-digit characters', () {
      expect(BanglaNumberToWords.toEnglishDigits('১,২৫০.৭৫'), '1,250.75');
    });
  });
}
