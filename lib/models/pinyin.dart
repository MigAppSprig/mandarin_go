// Data models for the Pinyin learning section.

/// One of the four Mandarin tones, plus the neutral tone.
class Tone {
  const Tone({
    required this.number,
    required this.diacritic,
    required this.englishName,
    required this.chineseName,
    required this.contour,
    required this.description,
    required this.exampleSyllable,
    required this.exampleHanzi,
    required this.exampleMeaning,
  });

  /// 1-4 for the four tones, 0 for the neutral tone.
  final int number;

  /// Symbol shown next to the tone number, e.g. "¯".
  final String diacritic;

  final String englishName;
  final String chineseName;

  /// Pitch contour, e.g. "5-5" (high and level).
  final String contour;

  final String description;
  final String exampleSyllable;
  final String exampleHanzi;
  final String exampleMeaning;
}

/// An example syllable attached to an initial or final, e.g. "bā (八) eight".
class SyllableExample {
  const SyllableExample({
    required this.syllable,
    required this.hanzi,
    required this.meaning,
  });

  final String syllable;
  final String hanzi;
  final String meaning;
}

/// A consonant initial (声母), e.g. "b".
class Initial {
  const Initial({
    required this.symbol,
    required this.hint,
    required this.examples,
  });

  final String symbol;

  /// English hint for how to pronounce it.
  final String hint;

  final List<SyllableExample> examples;
}

/// A vowel/nasal final (韵母), e.g. "a", "ang".
class Final {
  const Final({
    required this.symbol,
    required this.group,
    required this.hint,
    required this.examples,
  });

  final String symbol;

  /// One of: simple, compound, nasal.
  final String group;

  final String hint;
  final List<SyllableExample> examples;
}
