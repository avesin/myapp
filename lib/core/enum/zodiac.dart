enum Horoscope {
  aries('Aries', '♈'),
  taurus('Taurus', '♉'),
  gemini('Gemini', '♊'),
  cancer('Cancer', '♋'),
  leo('Leo', '♌'),
  virgo('Virgo', '♍'),
  libra('Libra', '♎'),
  scorpio('Scorpio', '♏'),
  sagittarius('Sagittarius', '♐'),
  capricorn('Capricorn', '♑'),
  aquarius('Aquarius', '♒'),
  pisces('Pisces', '♓');

  final String displayName;
  final String emoji;

  const Horoscope(this.displayName, this.emoji);
}
