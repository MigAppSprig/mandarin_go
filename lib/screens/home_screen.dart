import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/vocabulary_data.dart';
import '../models/vocabulary.dart';
import '../services/progress_controller.dart';
import '../theme/app_theme.dart';
import '../widgets/speak_button.dart';
import '../widgets/tone_colored_pinyin.dart';
import 'about_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.onNavigate});

  /// Callback to switch the bottom-navigation tab (0=Home … 4=Translate).
  final ValueChanged<int> onNavigate;

  @override
  Widget build(BuildContext context) {
    final progress = context.watch<ProgressController>();
    final word = VocabularyData.wordOfTheDay;

    return Scaffold(
      appBar: AppBar(
        title: const Text('MandarinGo · 学中文'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'About',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => const AboutScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            tooltip: 'Settings',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => const SettingsScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 24),
        children: [
          _buildWordOfTheDay(context, word),
          _buildProgress(context, progress),
          _buildSections(context),
          _buildTip(context),
        ],
      ),
    );
  }

  Widget _buildWordOfTheDay(BuildContext context, Word word) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.local_florist, color: AppColors.red),
                const SizedBox(width: 8),
                Text(
                  'WORD OF THE DAY',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                    color: AppColors.muted,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    word.hanzi,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: AppColors.ink,
                    ),
                  ),
                ),
                SpeakButton(text: word.hanzi),
              ],
            ),
            const SizedBox(height: 8),
            ToneColoredPinyin(
              pinyin: word.pinyin,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(height: 6),
            Text(
              word.english,
              style: TextStyle(fontSize: 16, color: AppColors.muted),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.paper,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    word.exampleHanzi,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: AppColors.ink,
                    ),
                  ),
                  const SizedBox(height: 4),
                  ToneColoredPinyin(pinyin: word.examplePinyin, fontSize: 14),
                  const SizedBox(height: 4),
                  Text(
                    word.exampleEnglish,
                    style: TextStyle(fontSize: 14, color: AppColors.muted),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgress(BuildContext context, ProgressController progress) {
    final total = VocabularyData.all.length;
    final learned = progress.learnedCount;
    final ratio = total == 0 ? 0.0 : learned / total;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your progress',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.ink,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: ratio,
                      minHeight: 10,
                      backgroundColor: AppColors.paperDark,
                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.jade),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  '$learned / $total',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: AppColors.ink,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Keep going! A few cards a day adds up fast.',
              style: TextStyle(fontSize: 13, color: AppColors.muted),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSections(BuildContext context) {
    final sections = <_Section>[
      _Section(
        icon: Icons.spellcheck,
        title: 'Pinyin',
        subtitle: 'Tones, initials & finals',
        color: AppColors.red,
        index: 1,
      ),
      _Section(
        icon: Icons.style,
        title: 'Flashcards',
        subtitle: 'Learn vocabulary',
        color: AppColors.jade,
        index: 2,
      ),
      _Section(
        icon: Icons.chat_bubble,
        title: 'Dialogues',
        subtitle: 'Real-life conversations',
        color: const Color(0xFF1565C0),
        index: 3,
      ),
      _Section(
        icon: Icons.translate,
        title: 'Translate',
        subtitle: 'English → Chinese',
        color: AppColors.gold,
        index: 4,
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.35,
        children: [
          for (final s in sections)
            Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              elevation: 1.5,
              shadowColor: Colors.black26,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () => onNavigate(s.index),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: s.color.withValues(alpha: 0.14),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(s.icon, color: s.color, size: 26),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            s.title,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: AppColors.ink,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            s.subtitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.muted,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTip(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.lightbulb_outline, color: AppColors.gold, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'Tip: tone is part of the meaning in Mandarin. 妈 (mā) "mother" '
              'and 马 (mǎ) "horse" differ only in tone — practice them together!',
              style: TextStyle(fontSize: 13, color: AppColors.muted, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}

class _Section {
  const _Section({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.index,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final int index;
}
