import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pinyin/pinyin.dart';

/// The result of an online machine translation.
class OnlineTranslation {
  const OnlineTranslation({
    required this.source,
    required this.hanzi,
    required this.pinyin,
  });

  /// The original English input.
  final String source;

  /// The translated Chinese text.
  final String hanzi;

  /// Tone-marked pinyin for [hanzi].
  final String pinyin;
}

/// Free, keyless English → Chinese machine translation.
///
/// Uses the MyMemory API (https://mymemory.translated.net), a documented free
/// service. The Chinese result is converted to tone-marked pinyin locally with
/// the `pinyin` package, and pronunciation is handled by the system TTS voice.
///
/// To swap in a paid/official provider (Google Cloud Translation, DeepL,
/// Baidu, …), replace [translate]'s HTTP call — the rest of the app is
/// unchanged.
class OnlineTranslator {
  OnlineTranslator._();

  static const String endpoint = 'https://api.mymemory.translated.net/get';

  /// Translates [text] (English → Chinese). Returns `null` on any failure so
  /// callers can degrade gracefully to the offline dictionary.
  static Future<OnlineTranslation?> translate(String text) async {
    final query = text.trim();
    if (query.isEmpty) return null;
    try {
      final uri = Uri.parse(endpoint).replace(
        queryParameters: <String, String>{'q': query, 'langpair': 'en|zh-CN'},
      );
      final response = await http.get(uri).timeout(const Duration(seconds: 12));
      if (response.statusCode != 200) return null;
      return parseResponse(response.body, source: query);
    } catch (_) {
      return null;
    }
  }

  /// Parses a MyMemory JSON response body. Kept pure for testability.
  static OnlineTranslation? parseResponse(String body, {String source = ''}) {
    try {
      final json = jsonDecode(body) as Map<String, dynamic>;
      if (json['responseStatus'] != 200) return null;
      final data = json['responseData'] as Map<String, dynamic>?;
      final translated = data?['translatedText'] as String?;
      if (translated == null || translated.trim().isEmpty) return null;
      final hanzi = translated.trim();
      return OnlineTranslation(
        source: source,
        hanzi: hanzi,
        pinyin: toPinyin(hanzi),
      );
    } catch (_) {
      return null;
    }
  }

  /// Converts Chinese characters to space-separated, tone-marked pinyin.
  ///
  /// Non-CJK characters (punctuation, digits, Latin letters) are stripped so
  /// the conversion never throws on common punctuation like "。" or "，".
  static String toPinyin(String hanzi) {
    final cleaned = hanzi.replaceAll(
      RegExp(r'[^\u4e00-\u9fff\u3400-\u4dbf\s]'),
      '',
    );
    if (cleaned.trim().isEmpty) return '';
    try {
      return PinyinHelper.getPinyin(
        cleaned,
        separator: ' ',
        format: PinyinFormat.WITH_TONE_MARK,
      ).replaceAll(RegExp(r'\s+'), ' ').trim();
    } catch (_) {
      return '';
    }
  }
}
