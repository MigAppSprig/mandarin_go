import 'package:flutter_tts/flutter_tts.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Thin wrapper around [FlutterTts] that speaks Mandarin.
///
/// The system text-to-speech engine on both iOS and Android ships a `zh-CN`
/// voice, so we can pronounce Chinese characters without bundling audio files.
class TtsService {
  TtsService._();

  static final TtsService instance = TtsService._();

  static const String _rateKey = 'tts_rate';
  static const double _defaultRate = 0.4; // slower for learners

  final FlutterTts _tts = FlutterTts();
  double _rate = _defaultRate;
  bool _ready = false;

  double get rate => _rate;

  /// Configure the engine and load the saved speech rate.
  Future<void> init() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _rate = prefs.getDouble(_rateKey) ?? _defaultRate;
    } catch (_) {
      _rate = _defaultRate;
    }
    await _apply();
  }

  Future<void> _apply() async {
    try {
      await _tts.setLanguage('zh-CN');
      await _tts.setSpeechRate(_rate);
      await _tts.setPitch(1.0);
      await _tts.setVolume(1.0);
      _ready = true;
    } catch (_) {
      // TTS is a best-effort feature; the rest of the app works without it.
    }
  }

  /// Set the default speech rate (0.25–0.75) and persist it.
  Future<void> setRate(double rate) async {
    _rate = rate.clamp(0.25, 0.75);
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setDouble(_rateKey, _rate);
    } catch (_) {}
    await _apply();
  }

  /// Speak [text] aloud (Chinese characters or pinyin).
  Future<void> speak(String text, {double? rate}) async {
    if (text.trim().isEmpty) return;
    if (!_ready) await _apply();
    try {
      await _tts.stop();
      await _tts.setSpeechRate(rate ?? _rate);
      await _tts.speak(text);
    } catch (_) {
      // Ignore — speech is non-essential.
    }
  }

  Future<void> stop() async {
    try {
      await _tts.stop();
    } catch (_) {}
  }
}
