import '../data/translation_data.dart';
import '../data/vocabulary_data.dart';

/// A unified translation result shown in the translator UI.
class TranslationResult {
  const TranslationResult({
    required this.hanzi,
    required this.pinyin,
    required this.english,
    required this.exampleHanzi,
    required this.examplePinyin,
    required this.exampleEnglish,
    required this.category,
    required this.isPhrase,
  });

  final String hanzi;
  final String pinyin;

  /// The English source that matched.
  final String english;

  final String exampleHanzi;
  final String examplePinyin;
  final String exampleEnglish;
  final String category;

  /// True when the match came from the phrase dictionary (vs. the word list).
  final bool isPhrase;
}

/// Offline English → Chinese matching over the phrase dictionary and word list.
class Translator {
  Translator._();

  static const int _maxResults = 6;

  /// Returns the best matches for [input], highest relevance first.
  static List<TranslationResult> translate(String input) {
    final query = _normalize(input);
    if (query.isEmpty) return const <TranslationResult>[];

    final scored = <_Scored>[];

    for (final entry in TranslationData.all) {
      final keys = <String>[entry.source, ...entry.aliases];
      final score = _bestScore(query, keys);
      if (score > 0) {
        scored.add(
          _Scored(
            score,
            TranslationResult(
              hanzi: entry.hanzi,
              pinyin: entry.pinyin,
              english: entry.source,
              exampleHanzi: entry.exampleHanzi,
              examplePinyin: entry.examplePinyin,
              exampleEnglish: entry.exampleEnglish,
              category: entry.category,
              isPhrase: true,
            ),
          ),
        );
      }
    }

    for (final word in VocabularyData.all) {
      final score = _bestScore(query, <String>[word.english]);
      if (score > 0) {
        scored.add(
          _Scored(
            score - 1, // slight preference for phrase entries
            TranslationResult(
              hanzi: word.hanzi,
              pinyin: word.pinyin,
              english: word.english,
              exampleHanzi: word.exampleHanzi,
              examplePinyin: word.examplePinyin,
              exampleEnglish: word.exampleEnglish,
              category: word.category,
              isPhrase: false,
            ),
          ),
        );
      }
    }

    scored.sort((a, b) => b.score.compareTo(a.score));

    // De-duplicate by hanzi, keep the highest-scoring entry.
    final seen = <String>{};
    final results = <TranslationResult>[];
    for (final s in scored) {
      if (results.length >= _maxResults) break;
      if (seen.add(s.result.hanzi)) {
        results.add(s.result);
      }
    }
    return results;
  }

  /// Highest match score between [query] and the normalized [keys].
  static int _bestScore(String query, List<String> keys) {
    var best = 0;
    for (final raw in keys) {
      final key = _normalize(raw);
      if (key.isEmpty) continue;
      final score = _score(query, key);
      if (score > best) best = score;
    }
    return best;
  }

  static int _score(String query, String key) {
    if (query == key) return 100;
    if (key.contains(query)) {
      // Require a meaningful overlap to avoid noise on tiny queries.
      if (query.length >= 3) return 70;
      if (query.length >= 2 && key.split(' ').contains(query)) return 65;
    }
    if (query.contains(key) && key.length >= 4) return 60;
    // Word-overlap scoring for multi-word inputs.
    final qWords = query.split(' ').toSet();
    final kWords = key.split(' ').toSet();
    final overlap = qWords.intersection(kWords).length;
    if (overlap > 0) return 20 + overlap * 10;
    return 0;
  }

  /// Lowercase, strip punctuation and parentheticals, and remove a leading
  /// "to " (so "to eat" matches "eat").
  static String _normalize(String input) {
    var s = input.toLowerCase().trim();
    s = s.replaceAll(RegExp(r'\([^)]*\)'), ' '); // remove (…)
    s = s.replaceAll(RegExp(r'[^a-z0-9\s]'), ' '); // strip punctuation
    s = s.replaceAll(RegExp(r'\s+'), ' ').trim();
    if (s.startsWith('to ')) s = s.substring(3);
    return s;
  }

  /// Whether the offline dictionaries contain an exact match for [input]
  /// (a phrase source/alias or a word's English gloss equal to the query).
  ///
  /// Used by the translator UI to prefer curated offline results — which also
  /// carry example sentences — over machine translation for known phrases.
  static bool hasExactMatch(String input) {
    final query = _normalize(input);
    if (query.isEmpty) return false;
    for (final entry in TranslationData.all) {
      final keys = <String>[entry.source, ...entry.aliases];
      if (keys.any((k) => _normalize(k) == query)) return true;
    }
    for (final word in VocabularyData.all) {
      if (_normalize(word.english) == query) return true;
    }
    return false;
  }

  /// A handful of example queries shown as tappable chips.
  static const List<String> suggestions = <String>[
    'hello',
    'thank you',
    'how much is this',
    'where is the bathroom',
    "I'm hungry",
    'I love you',
  ];
}

class _Scored {
  const _Scored(this.score, this.result);

  final int score;
  final TranslationResult result;
}
