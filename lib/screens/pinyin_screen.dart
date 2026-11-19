import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'pinyin_chart_screen.dart';
import 'pinyin_finals_screen.dart';
import 'pinyin_initials_screen.dart';
import 'pinyin_quiz_screen.dart';
import 'pinyin_rules_screen.dart';
import 'pinyin_tones_screen.dart';

class PinyinScreen extends StatelessWidget {
  const PinyinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pinyin Basics')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 24),
        children: [
          _buildIntro(context),
          _buildNavCard(
            context,
            icon: Icons.table_chart,
            title: 'Complete Pinyin Chart · 拼音总表',
            subtitle: 'All 5 tones, 23 initials & 24 finals in one table',
            color: AppColors.deepRed,
            onTap: () => _push(context, const PinyinChartScreen()),
          ),
          _buildToneLegend(context),
          _buildNavCard(
            context,
            icon: Icons.graphic_eq,
            title: 'The four tones',
            subtitle: 'The pitch of a syllable changes its meaning',
            color: AppColors.red,
            onTap: () => _push(context, const PinyinTonesScreen()),
          ),
          _buildNavCard(
            context,
            icon: Icons.abc,
            title: 'Initials (声母)',
            subtitle: '23 consonant sounds that start a syllable',
            color: AppColors.jade,
            onTap: () => _push(context, const PinyinInitialsScreen()),
          ),
          _buildNavCard(
            context,
            icon: Icons.text_fields,
            title: 'Finals (韵母)',
            subtitle: '24 vowel and nasal sounds that end a syllable',
            color: const Color(0xFF1565C0),
            onTap: () => _push(context, const PinyinFinalsScreen()),
          ),
          _buildNavCard(
            context,
            icon: Icons.rule,
            title: 'Tone-change rules',
            subtitle: 'Sandhi, neutral tone & where to put the mark',
            color: const Color(0xFF6A1B9A),
            onTap: () => _push(context, const PinyinRulesScreen()),
          ),
          _buildNavCard(
            context,
            icon: Icons.quiz,
            title: 'Tone practice',
            subtitle: 'Listen and guess the tone',
            color: AppColors.gold,
            onTap: () => _push(context, const PinyinQuizScreen()),
          ),
        ],
      ),
    );
  }

  void _push(BuildContext context, Widget screen) {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => screen));
  }

  Widget _buildIntro(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
      child: Text(
        'Mandarin is a tonal language. Every syllable has a tone — the pitch '
        'pattern of your voice — and the same sound with a different tone can '
        'mean a completely different word.',
        style: TextStyle(
          fontSize: 14,
          height: 1.5,
          color: AppColors.muted,
        ),
      ),
    );
  }

  Widget _buildToneLegend(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tone colours',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: AppColors.ink,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _legendChip('1st  ¯', AppColors.toneColors[1]!),
                _legendChip('2nd  ´', AppColors.toneColors[2]!),
                _legendChip('3rd  ˇ', AppColors.toneColors[3]!),
                _legendChip('4th  `', AppColors.toneColors[4]!),
                _legendChip('neutral', AppColors.toneColors[0]!),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _legendChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w700,
          fontSize: 13,
        ),
      ),
    );
  }

  Widget _buildNavCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.14),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
