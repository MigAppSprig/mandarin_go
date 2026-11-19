/// Helpers for working with tone-marked pinyin.
class PinyinUtils {
  PinyinUtils._();

  static const String _tone1 = 'āēīōūǖĀĒĪŌŪǕ';
  static const String _tone2 = 'áéíóúǘÁÉÍÓÚǗ';
  static const String _tone3 = 'ǎěǐǒǔǚǍĚǏǑǓǙ';
  static const String _tone4 = 'àèìòùǜÀÈÌÒÙǛ';

  /// Returns 1-4 for the tone of [syllable], or 0 for the neutral tone.
  static int toneOf(String syllable) {
    for (final ch in syllable.runes) {
      final c = String.fromCharCode(ch);
      if (_tone1.contains(c)) return 1;
      if (_tone2.contains(c)) return 2;
      if (_tone3.contains(c)) return 3;
      if (_tone4.contains(c)) return 4;
    }
    return 0;
  }

  static const Map<String, String> _toneToBase = <String, String>{
    'ā': 'a', 'á': 'a', 'ǎ': 'a', 'à': 'a',
    'ē': 'e', 'é': 'e', 'ě': 'e', 'è': 'e',
    'ī': 'i', 'í': 'i', 'ǐ': 'i', 'ì': 'i',
    'ō': 'o', 'ó': 'o', 'ǒ': 'o', 'ò': 'o',
    'ū': 'u', 'ú': 'u', 'ǔ': 'u', 'ù': 'u',
    'ǖ': 'ü', 'ǘ': 'ü', 'ǚ': 'ü', 'ǜ': 'ü',
    'Ā': 'A', 'Á': 'A', 'Ǎ': 'A', 'À': 'A',
    'Ē': 'E', 'É': 'E', 'Ě': 'E', 'È': 'E',
    'Ī': 'I', 'Í': 'I', 'Ǐ': 'I', 'Ì': 'I',
    'Ō': 'O', 'Ó': 'O', 'Ǒ': 'O', 'Ò': 'O',
    'Ū': 'U', 'Ú': 'U', 'Ǔ': 'U', 'Ù': 'U',
    'Ǖ': 'Ü', 'Ǘ': 'Ü', 'Ǚ': 'Ü', 'Ǜ': 'Ü',
  };

  /// Removes tone marks, turning "mǎ" into "ma".
  static String stripToneMarks(String syllable) {
    final buffer = StringBuffer();
    for (final ch in syllable.split('')) {
      buffer.write(_toneToBase[ch] ?? ch);
    }
    return buffer.toString();
  }
}
