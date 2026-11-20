import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'package:mandarin_go/data/dialogue_data.dart';
import 'package:mandarin_go/data/pinyin_data.dart';
import 'package:mandarin_go/data/translation_data.dart';
import 'package:mandarin_go/data/vocabulary_data.dart';
import 'package:mandarin_go/data/vocabulary_examples.dart';
import 'package:mandarin_go/services/online_translator.dart';
import 'package:mandarin_go/services/pinyin_audio_service.dart';
import 'package:mandarin_go/services/pinyin_confusion.dart';
import 'package:mandarin_go/services/pinyin_utils.dart';
import 'package:mandarin_go/services/translator.dart';

void main() {
  group('PinyinUtils', () {
    test('detects tones from tone marks', () {
      expect(PinyinUtils.toneOf('mā'), 1);
      expect(PinyinUtils.toneOf('má'), 2);
      expect(PinyinUtils.toneOf('mǎ'), 3);
      expect(PinyinUtils.toneOf('mà'), 4);
      expect(PinyinUtils.toneOf('ma'), 0);
    });

    test('strips tone marks', () {
      expect(PinyinUtils.stripToneMarks('mǎ'), 'ma');
      expect(PinyinUtils.stripToneMarks('nǐ hǎo'), 'ni hao');
      expect(PinyinUtils.stripToneMarks('nǚ'), 'nü');
    });
  });

  group('Translator', () {
    test('finds an exact phrase match', () {
      final results = Translator.translate('hello');
      expect(results, isNotEmpty);
      expect(results.first.hanzi, '你好');
      expect(results.first.pinyin, 'nǐ hǎo');
    });

    test('handles a word-level match', () {
      final results = Translator.translate('apple');
      expect(results, isNotEmpty);
      expect(results.first.hanzi, '苹果');
    });

    test('returns empty for garbage input', () {
      expect(Translator.translate('zzzzzzz'), isEmpty);
    });

    test('hasExactMatch detects curated phrases', () {
      expect(Translator.hasExactMatch('hello'), isTrue);
      expect(Translator.hasExactMatch('thank you very much'), isTrue);
      expect(Translator.hasExactMatch('apple'), isTrue);
    });

    test('hasExactMatch is false for unknown input', () {
      expect(Translator.hasExactMatch('a purple elephant on the moon'), isFalse);
    });
  });

  group('Data integrity', () {
    test('vocabulary ids are unique', () {
      final ids = VocabularyData.all.map((w) => w.id).toList();
      expect(ids.toSet().length, ids.length);
    });

    test('every word has non-empty fields', () {
      for (final w in VocabularyData.all) {
        expect(w.hanzi, isNotEmpty);
        expect(w.pinyin, isNotEmpty);
        expect(w.english, isNotEmpty);
      }
    });

    test('every word has at least 2 example sentences', () {
      for (final w in VocabularyData.all) {
        final examples = VocabularyExamples.forWord(w);
        expect(examples.length, greaterThanOrEqualTo(2), reason: w.id);
        for (final ex in examples) {
          expect(ex.hanzi, isNotEmpty, reason: w.id);
          expect(ex.pinyin, isNotEmpty, reason: w.id);
          expect(ex.english, isNotEmpty, reason: w.id);
        }
      }
    });

    test('translation entries and dialogues are non-empty', () {
      expect(TranslationData.all, isNotEmpty);
      expect(DialogueData.all, isNotEmpty);
    });

    test('every initial and final has a standalone sound', () {
      for (final i in PinyinData.initials) {
        final sound = PinyinData.initialSounds[i.symbol];
        expect(sound, isNotNull, reason: 'missing sound for initial ${i.symbol}');
        expect(sound!.hanzi, isNotEmpty);
        expect(sound.pinyin, isNotEmpty);
      }
      for (final f in PinyinData.finals) {
        final sound = PinyinData.finalSounds[f.symbol];
        expect(sound, isNotNull, reason: 'missing sound for final ${f.symbol}');
        expect(sound!.hanzi, isNotEmpty);
        expect(sound.pinyin, isNotEmpty);
      }
    });

    test('all 47 phoneme audio files are bundled', () {
      for (final i in PinyinData.initials) {
        final file = File('assets/${PinyinAudioService.initialAsset(i.symbol)}');
        expect(file.existsSync(), isTrue, reason: 'missing ${file.path}');
      }
      for (final f in PinyinData.finals) {
        final file = File('assets/${PinyinAudioService.finalAsset(f.symbol)}');
        expect(file.existsSync(), isTrue, reason: 'missing ${file.path}');
      }
    });
  });

  group('OnlineTranslator', () {
    test('toPinyin converts Chinese to tone-marked pinyin', () {
      expect(OnlineTranslator.toPinyin('你好'), 'nǐ hǎo');
    });

    test('toPinyin strips punctuation', () {
      final pinyin = OnlineTranslator.toPinyin('我想点一杯咖啡。');
      expect(pinyin, isNotEmpty);
      expect(pinyin.contains('。'), isFalse);
      expect(pinyin.contains('咖啡'), isFalse);
    });

    test('parseResponse extracts the translation', () {
      const body = '{"responseData":{"translatedText":"你好 世界","match":1},'
          '"responseStatus":200}';
      final result = OnlineTranslator.parseResponse(body, source: 'hello world');
      expect(result, isNotNull);
      expect(result!.hanzi, '你好 世界');
      expect(result.pinyin, 'nǐ hǎo shì jiè');
    });

    test('parseResponse returns null on error status', () {
      const body = '{"responseStatus":403,"responseDetails":"error"}';
      expect(OnlineTranslator.parseResponse(body), isNull);
    });

    test('parseResponse returns null on malformed JSON', () {
      expect(OnlineTranslator.parseResponse('not json'), isNull);
    });
  });

  group('Practice', () {
    test('every word has a valid HSK level', () {
      for (final w in VocabularyData.all) {
        expect(w.hskLevel, inInclusiveRange(1, 3), reason: w.id);
      }
    });

    test('every HSK level has words', () {
      for (final level in <int>[1, 2, 3]) {
        expect(VocabularyData.byLevel(level), isNotEmpty);
      }
    });

    test('byLevels filters correctly', () {
      final hsk1 = VocabularyData.byLevels(<int>{1});
      expect(hsk1.every((w) => w.hskLevel == 1), isTrue);
      expect(VocabularyData.byLevels(<int>{}).length, VocabularyData.all.length);
    });

    test('confusable pinyin options are distinct and wrong', () {
      const samples = <String>['nǐ hǎo', 'shì', 'zhōng guó', 'xìng qī', 'lǜ sè'];
      for (final pinyin in samples) {
        final options = PinyinConfusion.options(pinyin, count: 3);
        expect(options.length, 3, reason: pinyin);
        expect(options.toSet().length, options.length, reason: pinyin);
        expect(options.contains(pinyin), isFalse, reason: pinyin);
        for (final option in options) {
          expect(option.trim(), isNotEmpty, reason: pinyin);
        }
      }
    });
  });
}
