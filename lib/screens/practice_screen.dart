import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/vocabulary_data.dart';
import '../models/vocabulary.dart';
import '../services/progress_controller.dart';
import '../theme/app_theme.dart';
import 'fill_blank_screen.dart';
import 'flashcard_session_screen.dart';
import 'listen_write_screen.dart';
import 'pinyin_discrimination_screen.dart';
import 'pinyin_quiz_screen.dart';

/// Practice hub: choose an HSK scope, then pick a practice mode.
class PracticeScreen extends StatefulWidget {
  const PracticeScreen({super.key});

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  /// Selected HSK bands. Empty means "all levels".
  final Set<int> _levels = <int>{};

  List<Word> get _words => VocabularyData.byLevels(_levels);

  String get _scopeLabel {
    if (_levels.isEmpty) return 'All HSK 1–3';
    final sorted = _levels.toList()..sort();
    return 'HSK ${sorted.join(' + ')}';
  }

  void _toggleLevel(int level) {
    setState(() {
      if (_levels.contains(level)) {
        _levels.remove(level);
      } else {
        _levels.add(level);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final words = _words;
    return Scaffold(
      appBar: AppBar(title: const Text('Practice')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          _buildScopeSelector(words),
          const SizedBox(height: 16),
          _modeCard(
            context,
            emoji: '🎯',
            title: 'Pinyin discrimination',
            subtitle: 'Pick the right pinyin from similar-sounding options',
            color: const Color(0xFF1565C0),
            onTap: () => _push(
              context,
              PinyinDiscriminationScreen(words: words, title: _scopeLabel),
            ),
          ),
          _modeCard(
            context,
            emoji: '✍️',
            title: 'Listen & write pinyin',
            subtitle: 'Hear a word, type its pinyin (tones optional)',
            color: AppColors.jade,
            onTap: () => _push(
              context,
              ListenWriteScreen(words: words, title: _scopeLabel),
            ),
          ),
          _modeCard(
            context,
            emoji: '🧩',
            title: 'Fill the blank',
            subtitle: 'Pick the right word to complete the sentence',
            color: const Color(0xFF6A1B9A),
            onTap: () => _push(
              context,
              FillBlankScreen(words: words, title: _scopeLabel),
            ),
          ),
          _modeCard(
            context,
            emoji: '🎵',
            title: 'Tone recognition',
            subtitle: 'Hear a syllable and pick its tone',
            color: AppColors.red,
            onTap: () => _push(context, const PinyinQuizScreen()),
          ),
          _modeCard(
            context,
            emoji: '🔁',
            title: 'Smart review',
            subtitle: 'Focus on the words you have struggled with',
            color: AppColors.gold,
            onTap: () => _startSmartReview(context, words),
          ),
        ],
      ),
    );
  }

  Widget _buildScopeSelector(List<Word> words) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Practice scope',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: AppColors.ink,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              FilterChip(
                label: const Text('All'),
                selected: _levels.isEmpty,
                onSelected: (_) => setState(_levels.clear),
              ),
              for (final level in VocabularyData.levels)
                FilterChip(
                  label: Text('HSK $level'),
                  selected: _levels.contains(level),
                  onSelected: (_) => _toggleLevel(level),
                ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            '$_scopeLabel · ${words.length} words',
            style: TextStyle(fontSize: 13, color: AppColors.muted),
          ),
        ],
      ),
    );
  }

  Widget _modeCard(
    BuildContext context, {
    required String emoji,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: color.withValues(alpha: 0.25)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text(emoji, style: const TextStyle(fontSize: 26)),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: AppColors.ink,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        subtitle,
                        style: TextStyle(fontSize: 13, color: AppColors.muted),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.chevron_right, color: color),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _startSmartReview(BuildContext context, List<Word> scopeWords) {
    final progress = context.read<ProgressController>();
    final weak = scopeWords
        .where((w) => progress.weakWordIds.contains(w.id))
        .toList();
    if (weak.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'No weak words yet. Practice some flashcards first and we\'ll '
            'remember the tricky ones!',
          ),
        ),
      );
      return;
    }
    _push(
      context,
      FlashcardSessionScreen(words: weak, title: 'Smart review'),
    );
  }

  void _push(BuildContext context, Widget screen) {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => screen));
  }
}
