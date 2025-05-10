import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/core/enum/shio.dart';
import 'package:myapp/core/enum/zodiac.dart';
import 'package:myapp/core/util/global_utils.dart';

void main() {
  test('calculateAge returns correct age', () {
    final birthDate = DateTime(2000, 5, 10);
    final age = GlobalUtils.calculateAge(birthDate);
    expect(age, isNonNegative);
  });

  test('formatDate returns correct format', () {
    final date = DateTime(2024, 5, 10);
    expect(GlobalUtils.formatDate(date), '10 05 2024');
  });

  test('getHoroscope returns valid sign', () {
    expect(GlobalUtils.getHoroscopeByDate(DateTime(2024, 4, 15)), Horoscope.aries);
  });

  test('getZodiac returns valid sign', () {
    expect(GlobalUtils.getZodiacByDate(DateTime(1990, 8, 10)), Zodiac.horse);
  });
}