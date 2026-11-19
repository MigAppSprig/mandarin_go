/// A dictionary-style entry used by the offline English → Chinese translator.
class TranslationEntry {
  const TranslationEntry({
    required this.source,
    required this.aliases,
    required this.hanzi,
    required this.pinyin,
    required this.exampleHanzi,
    required this.examplePinyin,
    required this.exampleEnglish,
    required this.category,
  });

  /// Canonical English phrase used for display, e.g. "how are you".
  final String source;

  /// Alternative English wordings that should also match.
  final List<String> aliases;

  final String hanzi;
  final String pinyin;

  final String exampleHanzi;
  final String examplePinyin;
  final String exampleEnglish;

  final String category;
}
