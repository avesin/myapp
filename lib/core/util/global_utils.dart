import 'package:intl/intl.dart';
import 'package:myapp/core/enum/shio.dart';
import 'package:myapp/core/enum/zodiac.dart';

class GlobalUtils {

  static int calculateAge(DateTime birth) {
    final today = DateTime.now();
    int calculatedAge = today.year - birth.year;
    if (today.month < birth.month ||
        (today.month == birth.month && today.day < birth.day)) {
      calculatedAge--;
    }
    return calculatedAge;
  }

  static DateTime lastDateCapableToSignUp() {
    final now = DateTime.now();
    return DateTime(now.year - 17, now.month, now.day);
  }

  static String formatDate(DateTime date, {String pattern = 'dd MM yyyy'}) {
    return DateFormat(pattern).format(date);
  }

  static DateTime parseDate(String dateStr, {String pattern = 'dd MM yyyy'}) {
    return DateFormat(pattern).parse(dateStr);
  }

  static Horoscope getHoroscopeByDate(DateTime birthdate) {
    return getHoroscope(birthdate.day, birthdate.month);
  }

  static Horoscope getHoroscope(int day, int month) {
    if ((month == 1 && day >= 20) || (month == 2 && day <= 18)) {
      return Horoscope.aquarius;
    }
    if ((month == 2 && day >= 19) || (month == 3 && day <= 20)) {
      return Horoscope.pisces;
    }
    if ((month == 3 && day >= 21) || (month == 4 && day <= 19)) {
      return Horoscope.aries;
    }
    if ((month == 4 && day >= 20) || (month == 5 && day <= 20)) {
      return Horoscope.taurus;
    }
    if ((month == 5 && day >= 21) || (month == 6 && day <= 20)) {
      return Horoscope.gemini;
    }
    if ((month == 6 && day >= 21) || (month == 7 && day <= 22)) {
      return Horoscope.cancer;
    }
    if ((month == 7 && day >= 23) || (month == 8 && day <= 22)) {
      return Horoscope.leo;
    }
    if ((month == 8 && day >= 23) || (month == 9 && day <= 22)) {
      return Horoscope.virgo;
    }
    if ((month == 9 && day >= 23) || (month == 10 && day <= 22)) {
      return Horoscope.libra;
    }
    if ((month == 10 && day >= 23) || (month == 11 && day <= 21)) {
      return Horoscope.scorpio;
    }
    if ((month == 11 && day >= 22) || (month == 12 && day <= 21)) {
      return Horoscope.sagittarius;
    }
    return Horoscope.capricorn;
  }

  static Zodiac getZodiacByDate(DateTime birthdate) {
    return getZodiac(birthdate.year);
  }

  static Zodiac getZodiac(int year) {
    final animals = [
      Zodiac.rat,
      Zodiac.ox,
      Zodiac.tiger,
      Zodiac.rabbit,
      Zodiac.dragon,
      Zodiac.snake,
      Zodiac.horse,
      Zodiac.goat,
      Zodiac.monkey,
      Zodiac.rooster,
      Zodiac.dog,
      Zodiac.pig,
    ];
    return animals[year % 12];
  }
}
