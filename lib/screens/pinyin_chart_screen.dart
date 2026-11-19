import 'package:flutter/material.dart';

import '../data/pinyin_data.dart';
import '../models/pinyin.dart';
import '../services/pinyin_audio_service.dart';
import '../services/tts_service.dart';
import '../theme/app_theme.dart';
import '../widgets/tone_colored_pinyin.dart';

/// A single scrollable reference chart containing every tone, initial and
/// final, each with an example and tap-to-pronounce.
class PinyinChartScreen extends StatelessWidget {
  const PinyinChartScreen({super.key});

  /// Initials grouped by place of articulation (order matches [PinyinData]).
  static const List<(String, List<String>)> _initialGroups = <(String, List<String>)>[
    ('唇音 labial', ['b', 'p', 'm', 'f']),
    ('舌尖音 alveolar', ['d', 't', 'n', 'l']),
    ('舌根音 velar', ['g', 'k', 'h']),
    ('舌面音 palatal', ['j', 'q', 'x']),
    ('翘舌音 retroflex', ['zh', 'ch', 'sh', 'r']),
    ('平舌音 dental', ['z', 'c', 's']),
    ('半元音 glides', ['y', 'w']),
  ];

  @override
  Widget build(BuildContext context) {
    final initialBySymbol = <String, Initial>{
      for (final i in PinyinData.initials) i.symbol: i,
    };

    return Scaffold(
      appBar: AppBar(title: const Text('Pinyin Chart · 拼音总表')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          Text(
            '一张表看全拼音：5 个声调、23 个声母、24 个韵母。'
            '点任意格子即可听该声母/韵母的单独发音（声母呼读音、韵母本音）。',
            style: TextStyle(fontSize: 13, height: 1.5, color: AppColors.muted),
          ),
          const SizedBox(height: 12),
          _sectionTitle('声调 Tones', '5'),
          _buildTones(context),
          _sectionTitle('声母 Initials', '23'),
          for (final (label, symbols) in _initialGroups) ...[
            _groupLabel(label),
            _soundGrid([
              for (final s in symbols) _initialTile(initialBySymbol[s]!),
            ]),
          ],
          _sectionTitle('韵母 Finals', '24'),
          for (final group in PinyinData.finalGroups) ...[
            _groupLabel(_finalGroupLabel(group)),
            _soundGrid([
              for (final f in PinyinData.finalsInGroup(group)) _finalTile(f),
            ]),
          ],
        ],
      ),
    );
  }

  // ── Section headers ──────────────────────────────────────────────────────
  Widget _sectionTitle(String title, String count) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: AppColors.ink,
            ),
          ),
          const SizedBox(width: 8),
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Text(
              count,
              style: TextStyle(fontSize: 13, color: AppColors.muted),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Divider(color: AppColors.paperDark, thickness: 1),
          ),
        ],
      ),
    );
  }

  Widget _groupLabel(String label) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 10, 4, 6),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: AppColors.muted,
        ),
      ),
    );
  }

  String _finalGroupLabel(String group) {
    switch (group) {
      case 'simple':
        return '单韵母 simple';
      case 'compound':
        return '复韵母 compound';
      case 'nasal':
        return '鼻韵母 nasal';
      default:
        return group;
    }
  }

  // ── Tones ────────────────────────────────────────────────────────────────
  Widget _buildTones(BuildContext context) {
    return Column(
      children: [
        for (final tone in PinyinData.tones) _toneRow(tone),
      ],
    );
  }

  Widget _toneRow(Tone tone) {
    final color = AppColors.toneColors[tone.number]!;
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.14),
                shape: BoxShape.circle,
              ),
              child: Text(
                tone.number == 0 ? '·' : '${tone.number}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: color,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${tone.englishName} ${tone.chineseName}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppColors.ink,
                    ),
                  ),
                  Text(
                    'contour ${tone.contour}',
                    style: TextStyle(fontSize: 12, color: AppColors.muted),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    ToneColoredPinyin(
                      pinyin: tone.exampleSyllable,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      tone.exampleHanzi,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.ink,
                      ),
                    ),
                  ],
                ),
                Text(
                  tone.exampleMeaning,
                  style: TextStyle(fontSize: 11, color: AppColors.muted),
                ),
              ],
            ),
            const SizedBox(width: 8),
            _speak(tone.exampleHanzi, color),
          ],
        ),
      ),
    );
  }

  // ── Sound grid (initials & finals) ───────────────────────────────────────
  Widget _soundGrid(List<Widget> tiles) {
    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      childAspectRatio: 1.15,
      children: tiles,
    );
  }

  Widget _initialTile(Initial initial) {
    final sound = PinyinData.initialSounds[initial.symbol];
    return _tile(
      symbol: initial.symbol,
      soundHanzi: sound?.hanzi ?? '',
      soundPinyin: sound?.pinyin ?? '',
      color: AppColors.jade,
      onTap: () => PinyinAudioService.instance.playInitial(
        initial.symbol,
        fallbackHanzi: sound?.hanzi ?? '',
      ),
    );
  }

  Widget _finalTile(Final finalSound) {
    final sound = PinyinData.finalSounds[finalSound.symbol];
    return _tile(
      symbol: finalSound.symbol,
      soundHanzi: sound?.hanzi ?? '',
      soundPinyin: sound?.pinyin ?? '',
      color: _finalColor(finalSound.group),
      onTap: () => PinyinAudioService.instance.playFinal(
        finalSound.symbol,
        fallbackHanzi: sound?.hanzi ?? '',
      ),
    );
  }

  Widget _tile({
    required String symbol,
    required String soundHanzi,
    required String soundPinyin,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      elevation: 1,
      shadowColor: Colors.black12,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                symbol,
                style: TextStyle(
                  fontSize: symbol.length > 2 ? 18 : 22,
                  fontWeight: FontWeight.w800,
                  color: color,
                ),
              ),
              const SizedBox(height: 2),
              ToneColoredPinyin(
                pinyin: soundPinyin,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              Text(
                soundHanzi,
                style: TextStyle(fontSize: 12, color: AppColors.muted),
              ),
              const SizedBox(height: 1),
              Icon(Icons.volume_up_rounded, size: 13, color: color.withValues(alpha: 0.7)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _speak(String text, Color color) {
    return Material(
      color: color.withValues(alpha: 0.14),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: () => TtsService.instance.speak(text),
        child: SizedBox(
          width: 34,
          height: 34,
          child: Icon(Icons.volume_up_rounded, size: 18, color: color),
        ),
      ),
    );
  }

  Color _finalColor(String group) {
    switch (group) {
      case 'simple':
        return AppColors.jade;
      case 'compound':
        return const Color(0xFF1565C0);
      case 'nasal':
        return const Color(0xFF6A1B9A);
      default:
        return AppColors.muted;
    }
  }
}
