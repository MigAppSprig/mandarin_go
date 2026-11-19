import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/vocabulary_data.dart';
import '../models/vocabulary.dart';
import '../services/progress_controller.dart';
import '../theme/app_theme.dart';
import 'flashcard_session_screen.dart';

class FlashcardsScreen extends StatelessWidget {
  const FlashcardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final progress = context.watch<ProgressController>();
    final total = VocabularyData.all.length;
    final learned = progress.learnedCount;

    return Scaffold(
      appBar: AppBar(title: const Text('Flashcards')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 24),
        children: [
          _buildOverview(context, learned, total),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 4),
            child: FilledButton.icon(
              onPressed: () => _startSession(context, VocabularyData.all, 'All words'),
              icon: const Icon(Icons.play_arrow),
              label: const Text('Start all words'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 4),
            child: Text(
              'Choose a deck',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
                color: AppColors.muted,
              ),
            ),
          ),
          for (final category in VocabularyData.categories)
            _buildCategoryCard(context, progress, category),
        ],
      ),
    );
  }

  Widget _buildOverview(BuildContext context, int learned, int total) {
    final ratio = total == 0 ? 0.0 : learned / total;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.style, color: AppColors.jade),
                const SizedBox(width: 8),
                Text(
                  '$learned of $total words learned',
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: AppColors.ink,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: ratio,
                minHeight: 10,
                backgroundColor: AppColors.paperDark,
                valueColor: const AlwaysStoppedAnimation<Color>(AppColors.jade),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Flip the card to reveal the answer, then tell the app whether '
              'you knew it. Words you miss come back sooner.',
              style: TextStyle(fontSize: 13, height: 1.4, color: AppColors.muted),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
    BuildContext context,
    ProgressController progress,
    String category,
  ) {
    final words = VocabularyData.inCategory(category);
    final learned = words.where((w) => progress.isLearned(w.id)).length;

    return Card(
      child: ListTile(
        onTap: () => _startSession(context, words, category),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        leading: Container(
          width: 44,
          height: 44,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.red.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            _categoryEmoji(category),
            style: const TextStyle(fontSize: 20),
          ),
        ),
        title: Text(
          category,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        subtitle: Text('$learned / ${words.length} learned'),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }

  String _categoryEmoji(String category) {
    switch (category) {
      case 'Greetings':
        return '👋';
      case 'People':
        return '🧑';
      case 'Numbers':
        return '🔢';
      case 'Family':
        return '👨‍👩‍👧‍👦';
      case 'Food':
        return '🍜';
      case 'Time':
        return '⏰';
      case 'Verbs':
        return '🏃';
      case 'Adjectives':
        return '🎨';
      case 'Places':
        return '🏙️';
      case 'Grammar':
        return '❓';
      case 'Common':
        return '💬';
      default:
        return '📚';
    }
  }

  void _startSession(BuildContext context, List<Word> words, String title) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => FlashcardSessionScreen(words: words, title: title),
      ),
    );
  }
}
