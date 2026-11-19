import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/vocabulary_data.dart';
import '../data/vocabulary_examples.dart';
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
            onPressed: () => _push(context, const AboutScreen()),
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            tooltip: 'Settings',
            onPressed: () => _push(context, const SettingsScreen()),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 28),
        children: [
          _buildWelcomeBanner(),
          _buildWordOfTheDay(word),
          _buildProgress(progress),
          _buildSections(),
          _buildTip(),
        ],
      ),
    );
  }

  void _push(BuildContext context, Widget screen) {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => screen));
  }

  // ── Welcome banner ──────────────────────────────────────────────────────
  Widget _buildWelcomeBanner() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 4, 16, 4),
      padding: const EdgeInsets.fromLTRB(22, 22, 16, 22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.red, AppColors.deepRed],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.red.withValues(alpha: 0.35),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '你好！👋',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Welcome to MandarinGo — let\'s learn Chinese today.',
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.4,
                    color: Colors.white.withValues(alpha: 0.9),
                  ),
                ),
                const SizedBox(height: 14),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('🎯', style: TextStyle(fontSize: 14)),
                      SizedBox(width: 6),
                      Text(
                        'A little every day',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 84,
            height: 84,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.16),
              shape: BoxShape.circle,
            ),
            child: const Text('🀄', style: TextStyle(fontSize: 46)),
          ),
        ],
      ),
    );
  }

  // ── Word of the day ─────────────────────────────────────────────────────
  Widget _buildWordOfTheDay(Word word) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.gold.withValues(alpha: 0.4)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Opacity(
              opacity: 0.5,
              child: Text('🏮', style: TextStyle(fontSize: 40)),
            ),
          ),
          Column(
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
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.2,
                      color: AppColors.red,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      word.hanzi,
                      style: const TextStyle(
                        fontSize: 46,
                        fontWeight: FontWeight.w800,
                        color: AppColors.ink,
                        height: 1.1,
                      ),
                    ),
                  ),
                  SpeakButton(text: word.hanzi, size: 52),
                ],
              ),
              const SizedBox(height: 10),
              ToneColoredPinyin(
                pinyin: word.pinyin,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 4),
              Text(
                word.english,
                style: TextStyle(fontSize: 16, color: AppColors.muted),
              ),
              const SizedBox(height: 14),
              for (final ex in VocabularyExamples.forWord(word)) ...[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: AppColors.paper,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              ex.hanzi,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: AppColors.ink,
                              ),
                            ),
                          ),
                          SpeakButton(text: ex.hanzi, size: 36),
                        ],
                      ),
                      const SizedBox(height: 6),
                      ToneColoredPinyin(pinyin: ex.pinyin, fontSize: 14),
                      const SizedBox(height: 4),
                      Text(
                        ex.english,
                        style: TextStyle(fontSize: 14, color: AppColors.muted),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ],
          ),
        ],
      ),
    );
  }

  // ── Progress ────────────────────────────────────────────────────────────
  Widget _buildProgress(ProgressController progress) {
    final total = VocabularyData.all.length;
    final learned = progress.learnedCount;
    final ratio = total == 0 ? 0.0 : (learned / total).clamp(0.0, 1.0);

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 72,
            height: 72,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: ratio,
                  strokeWidth: 8,
                  backgroundColor: AppColors.paperDark,
                  valueColor: const AlwaysStoppedAnimation<Color>(AppColors.jade),
                ),
                Text(
                  '${(ratio * 100).round()}%',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: AppColors.ink,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your progress',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: AppColors.ink,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$learned of $total words learned',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.jade,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Keep going! A few cards a day adds up fast.',
                  style: TextStyle(fontSize: 13, color: AppColors.muted),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Section grid ────────────────────────────────────────────────────────
  Widget _buildSections() {
    const sections = <_Section>[
      _Section(
        emoji: '🎵',
        title: 'Pinyin',
        subtitle: 'Tones · initials · finals',
        color: AppColors.red,
        index: 1,
      ),
      _Section(
        emoji: '🗂️',
        title: 'Flashcards',
        subtitle: 'Learn vocabulary',
        color: AppColors.jade,
        index: 2,
      ),
      _Section(
        emoji: '💬',
        title: 'Dialogues',
        subtitle: 'Real conversations',
        color: Color(0xFF1565C0),
        index: 3,
      ),
      _Section(
        emoji: '🌏',
        title: 'Translate',
        subtitle: 'English → Chinese',
        color: Color(0xFFE07B00),
        index: 4,
      ),
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 14,
        crossAxisSpacing: 14,
        childAspectRatio: 1.15,
        children: [
          for (final s in sections) _sectionCard(s),
        ],
      ),
    );
  }

  Widget _sectionCard(_Section s) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [s.color, s.color.withValues(alpha: 0.72)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: s.color.withValues(alpha: 0.30),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(22),
          onTap: () => onNavigate(s.index),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(s.emoji, style: const TextStyle(fontSize: 40)),
                const SizedBox(height: 12),
                Text(
                  s.title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  s.subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withValues(alpha: 0.9),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ── Tip ─────────────────────────────────────────────────────────────────
  Widget _buildTip() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.gold.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.gold.withValues(alpha: 0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('💡', style: TextStyle(fontSize: 22)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Tip: tone is part of the meaning in Mandarin. '
              '妈 (mā) "mother" and 马 (mǎ) "horse" differ only in tone — '
              'practice them together!',
              style: TextStyle(
                fontSize: 13,
                height: 1.45,
                color: AppColors.muted,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Section {
  const _Section({
    required this.emoji,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.index,
  });

  final String emoji;
  final String title;
  final String subtitle;
  final Color color;
  final int index;
}
