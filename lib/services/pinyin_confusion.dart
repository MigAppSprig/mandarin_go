import 'pinyin_utils.dart';

/// Generates confusable (near-sound) pinyin options for discrimination practice.
///
/// Options mix tone variants (the same syllable with a different tone) with
/// commonly confused initials/finals (zh/z, ch/c, sh/s, n/l, -n/-ng), which is
/// exactly what learners need to train their ears and eyes on.
class PinyinConfusion {
  PinyinConfusion._();

  static const Map<String, Map<int, String>> _baseToTone = <String, Map<int, String>>{
    'a': {1: 'ā', 2: 'á', 3: 'ǎ', 4: 'à'},
    'e': {1: 'ē', 2: 'é', 3: 'ě', 4: 'è'},
    'i': {1: 'ī', 2: 'í', 3: 'ǐ', 4: 'ì'},
    'o': {1: 'ō', 2: 'ó', 3: 'ǒ', 4: 'ò'},
    'u': {1: 'ū', 2: 'ú', 3: 'ǔ', 4: 'ù'},
    'ü': {1: 'ǖ', 2: 'ǘ', 3: 'ǚ', 4: 'ǜ'},
  };

  /// Up to [count] wrong pinyin options for [pinyin].
  static List<String> options(String pinyin, {int count = 3}) {
    final syllables = pinyin
        .split(RegExp(r'\s+'))
        .where((s) => s.isNotEmpty)
        .toList();
    if (syllables.isEmpty) return const <String>[];
    final correct = syllables.join(' ');
    final candidates = <String>{};

    for (var i = 0; i < syllables.length; i++) {
      final syllable = syllables[i];
      final tone = PinyinUtils.toneOf(syllable);
      final base = PinyinUtils.stripToneMarks(syllable);

      // Same syllable, different tone.
      for (final t in const <int>[1, 2, 3, 4, 0]) {
        final variant = _applyTone(base, t);
        if (variant != syllable) {
          candidates.add(_replaceAt(syllables, i, variant));
        }
      }

      // Easily confused initials / finals.
      for (final swapped in _swaps(base)) {
        final variant = _applyTone(swapped, tone);
        if (variant != syllable) {
          candidates.add(_replaceAt(syllables, i, variant));
        }
      }
    }

    candidates.remove(correct);
    final list = candidates.toList()..shuffle();
    return list.take(count).toList();
  }

  static String _replaceAt(List<String> syllables, int index, String value) {
    final copy = List<String>.from(syllables);
    copy[index] = value;
    return copy.join(' ');
  }

  /// Applies tone [tone] (1-4, or 0 = neutral) to a toneless [base].
  static String _applyTone(String base, int tone) {
    if (tone == 0) return base;

    String target;
    if (base.contains('a')) {
      target = 'a';
    } else if (base.contains('o')) {
      target = 'o';
    } else if (base.contains('e')) {
      target = 'e';
    } else if (base.contains('iu')) {
      target = 'u';
    } else if (base.contains('ui')) {
      target = 'i';
    } else if (base.contains('ü')) {
      target = 'ü';
    } else if (base.contains('u')) {
      target = 'u';
    } else if (base.contains('i')) {
      target = 'i';
    } else {
      target = '';
    }

    final marks = _baseToTone[target];
    if (target.isEmpty || marks == null) return base;
    return base.replaceFirst(target, marks[tone]!);
  }

  static List<String> _swaps(String base) {
    final out = <String>[];
    if (base.startsWith('zh')) {
      out.add('z${base.substring(2)}');
    } else if (base.startsWith('z')) {
      out.add('zh${base.substring(1)}');
    }
    if (base.startsWith('ch')) {
      out.add('c${base.substring(2)}');
    } else if (base.startsWith('c')) {
      out.add('ch${base.substring(1)}');
    }
    if (base.startsWith('sh')) {
      out.add('s${base.substring(2)}');
    } else if (base.startsWith('s')) {
      out.add('sh${base.substring(1)}');
    }
    if (base.startsWith('n')) out.add('l${base.substring(1)}');
    if (base.startsWith('l')) out.add('n${base.substring(1)}');

    if (base.endsWith('ang')) {
      out.add('${base.substring(0, base.length - 3)}an');
    } else if (base.endsWith('an')) {
      out.add('${base}g');
    }
    if (base.endsWith('eng')) {
      out.add('${base.substring(0, base.length - 3)}en');
    } else if (base.endsWith('en')) {
      out.add('${base}g');
    }
    if (base.endsWith('ing')) {
      out.add('${base.substring(0, base.length - 3)}in');
    } else if (base.endsWith('in')) {
      out.add('${base}g');
    }
    return out;
  }
}
