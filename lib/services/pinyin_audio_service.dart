import 'package:audioplayers/audioplayers.dart';

import 'tts_service.dart';

/// Plays the bundled phoneme recordings (声母呼读音 / 韵母本音).
///
/// Each initial and final has a pre-recorded M4A clip under
/// `assets/audio/pinyin/` (47 files, ~0.9 MB total). Bundled audio makes
/// pronunciation offline and consistent across devices. If a clip is missing
/// or fails to play, we fall back to the system TTS voice using the
/// representative hanzi.
class PinyinAudioService {
  PinyinAudioService._();

  static final PinyinAudioService instance = PinyinAudioService._();

  final AudioPlayer _player = AudioPlayer();

  /// Asset path for an initial's clip, e.g. `audio/pinyin/initial_zh.m4a`.
  static String initialAsset(String symbol) =>
      'audio/pinyin/initial_${_safe(symbol)}.m4a';

  /// Asset path for a final's clip, e.g. `audio/pinyin/final_ang.m4a`.
  static String finalAsset(String symbol) =>
      'audio/pinyin/final_${_safe(symbol)}.m4a';

  /// `ü` is awkward in a filename, so encode it as `v`.
  static String _safe(String symbol) => symbol.replaceAll('ü', 'v');

  Future<void> playInitial(String symbol, {String fallbackHanzi = ''}) =>
      _play(initialAsset(symbol), fallbackHanzi);

  Future<void> playFinal(String symbol, {String fallbackHanzi = ''}) =>
      _play(finalAsset(symbol), fallbackHanzi);

  Future<void> _play(String assetPath, String fallbackHanzi) async {
    try {
      await _player.stop();
      await _player.play(AssetSource(assetPath));
    } catch (_) {
      if (fallbackHanzi.isNotEmpty) {
        await TtsService.instance.speak(fallbackHanzi);
      }
    }
  }
}
