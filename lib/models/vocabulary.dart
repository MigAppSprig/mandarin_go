/// Vocabulary entry used by the flashcards, dictionary and translator.
class Word {
  const Word({
    required this.id,
    required this.hanzi,
    required this.pinyin,
    required this.english,
    required this.category,
    required this.exampleHanzi,
    required this.examplePinyin,
    required this.exampleEnglish,
  });

  final String id;

  /// Chinese characters, e.g. "你好".
  final String hanzi;

  /// Tone-marked pinyin, e.g. "nǐ hǎo".
  final String pinyin;

  /// English translation.
  final String english;

  /// Grouping label used across the UI, e.g. "Greetings".
  final String category;

  final String exampleHanzi;
  final String examplePinyin;
  final String exampleEnglish;
}
