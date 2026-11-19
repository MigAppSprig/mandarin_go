import 'package:flutter/material.dart';

import '../data/pinyin_data.dart';
import '../models/pinyin.dart';
import '../services/pinyin_audio_service.dart';
import '../theme/app_theme.dart';
import '../widgets/speak_button.dart';

class PinyinFinalsScreen extends StatelessWidget {
  const PinyinFinalsScreen({super.key});

  static const Map<String, String> _groupLabels = {
    'simple': 'Simple finals',
    'compound': 'Compound finals',
    'nasal': 'Nasal finals',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Finals · 韵母')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 24),
        children: [
          for (final group in PinyinData.finalGroups) ...[
            _groupHeader(group),
            for (final finalSound in PinyinData.finalsInGroup(group))
              _buildFinal(context, finalSound),
          ],
        ],
      ),
    );
  }

  Widget _groupHeader(String group) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 4),
      child: Text(
        _groupLabels[group] ?? group,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
          color: AppColors.muted,
        ),
      ),
    );
  }

  Widget _buildFinal(BuildContext context, Final finalSound) {
    final color = _groupColor(finalSound.group);
    final sound = PinyinData.finalSounds[finalSound.symbol];
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 52,
                  height: 52,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    finalSound.symbol,
                    style: TextStyle(
                      fontSize: finalSound.symbol.length > 2 ? 18 : 22,
                      fontWeight: FontWeight.w800,
                      color: color,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                SpeakButton(
                  text: sound?.hanzi ?? '',
                  size: 34,
                  color: color,
                  onTap: () => PinyinAudioService.instance.playFinal(
                    finalSound.symbol,
                    fallbackHanzi: sound?.hanzi ?? '',
                  ),
                ),
              ],
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    finalSound.hint,
                    style: TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      color: AppColors.muted,
                    ),
                  ),
                  const SizedBox(height: 10),
                  for (final ex in finalSound.examples) _exampleRow(context, ex, color),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _exampleRow(BuildContext context, SyllableExample ex, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Text(
            ex.hanzi,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.ink,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              ex.syllable,
              style: TextStyle(fontSize: 16, color: color),
            ),
          ),
          Text(
            ex.meaning,
            style: TextStyle(fontSize: 13, color: AppColors.muted),
          ),
          const SizedBox(width: 8),
          SpeakButton(text: ex.hanzi, size: 34, color: color),
        ],
      ),
    );
  }

  Color _groupColor(String group) {
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
