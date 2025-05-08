enum Zodiac {
  rat('Rat', '🐭'),
  ox('Ox', '🐂'),
  tiger('Tiger', '🐅'),
  rabbit('Rabbit', '🐇'),
  dragon('Dragon', '🐉'),
  snake('Snake', '🐍'),
  horse('Horse', '🐎'),
  goat('Goat', '🐐'),
  monkey('Monkey', '🐒'),
  rooster('Rooster', '🐓'),
  dog('Dog', '🐕'),
  pig('Pig', '🐖');

  final String displayName;
  final String emoji;

  const Zodiac(this.displayName, this.emoji);
}
