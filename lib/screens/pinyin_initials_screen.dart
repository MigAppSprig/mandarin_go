import 'package:flutter/material.dart';

import '../data/pinyin_data.dart';
import '../models/pinyin.dart';
import '../services/pinyin_audio_service.dart';
import '../theme/app_theme.dart';
import '../widgets/speak_button.dart';

class PinyinInitialsScreen extends StatelessWidget {
  const PinyinInitialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Initials · 声母')),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 24),
        itemCount: PinyinData.initials.length,
        itemBuilder: (context, index) => _buildInitial(
          context,
          PinyinData.initials[index],
        ),
      ),
    );
  }

  Widget _buildInitial(BuildContext context, Initial initial) {
    final sound = PinyinData.initialSounds[initial.symbol];
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
                    color: AppColors.jade.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    initial.symbol,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: AppColors.jade,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                SpeakButton(
                  text: sound?.hanzi ?? '',
                  size: 34,
                  color: AppColors.jade,
                  onTap: () => PinyinAudioService.instance.playInitial(
                    initial.symbol,
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
                    initial.hint,
                    style: TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      color: AppColors.muted,
                    ),
                  ),
                  const SizedBox(height: 10),
                  for (final ex in initial.examples)
                    _exampleRow(context, ex),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _exampleRow(BuildContext context, SyllableExample ex) {
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
              style: TextStyle(fontSize: 16, color: AppColors.jade),
            ),
          ),
          Text(
            ex.meaning,
            style: TextStyle(fontSize: 13, color: AppColors.muted),
          ),
          const SizedBox(width: 8),
          SpeakButton(text: ex.hanzi, size: 34),
        ],
      ),
    );
  }
}
