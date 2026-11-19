import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/vocabulary.dart';
import '../services/progress_controller.dart';
import '../theme/app_theme.dart';
import '../widgets/speak_button.dart';
import '../widgets/tone_colored_pinyin.dart';

/// A single flashcard study session over a deck of words.
class FlashcardSessionScreen extends StatefulWidget {
  const FlashcardSessionScreen({
    super.key,
    required this.words,
    required this.title,
  });

  final List<Word> words;
  final String title;

  @override
  State<FlashcardSessionScreen> createState() => _FlashcardSessionScreenState();
}

class _FlashcardSessionScreenState extends State<FlashcardSessionScreen> {
  late List<Word> _queue;
  final Set<String> _seen = <String>{};
  final Set<String> _firstTryCorrect = <String>{};
  final Set<String> _needsReview = <String>{};
  bool _flipped = false;
  bool _finished = false;

  @override
  void initState() {
    super.initState();
    _queue = List<Word>.from(widget.words)..shuffle(Random());
  }

  Word get _current => _queue.first;

  void _flip() => setState(() => _flipped = !_flipped);

  void _answer(bool correct) {
    final word = _current;
    final progress = context.read<ProgressController>();

    if (correct) {
      progress.markCorrect(word.id);
      if (!_seen.contains(word.id)) _firstTryCorrect.add(word.id);
      _seen.add(word.id);
      setState(() {
        _queue.removeAt(0);
        _flipped = false;
        if (_queue.isEmpty) _finished = true;
      });
    } else {
      progress.markWrong(word.id);
      _needsReview.add(word.id);
      _seen.add(word.id);
      setState(() {
        if (_queue.length > 1) {
          final target = min(3, _queue.length - 1);
          final item = _queue.removeAt(0);
          _queue.insert(target, item);
        }
        _flipped = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: _finished ? _buildSummary() : _buildCard(),
    );
  }

  Widget _buildCard() {
    final word = _current;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(
                word.category,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: AppColors.muted,
                ),
              ),
              const Spacer(),
              Text(
                '${_queue.length} left',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.muted,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            value: 1 - (_queue.length / widget.words.length),
            minHeight: 6,
            borderRadius: BorderRadius.circular(3),
            backgroundColor: AppColors.paperDark,
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.jade),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GestureDetector(
              onTap: _flip,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                transitionBuilder: (child, animation) => RotationYTransition(
                  animation: animation,
                  child: child,
                ),
                child: _flipped
                    ? _buildBack(word)
                    : _buildFront(word),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => _answer(false),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.red,
                    side: const BorderSide(color: AppColors.red),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  icon: const Icon(Icons.refresh),
                  label: const Text('Review again'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilledButton.icon(
                  onPressed: () => _answer(true),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.jade,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  icon: const Icon(Icons.check),
                  label: const Text('Got it'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFront(Word word) {
    return Container(
      key: const ValueKey('front'),
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            word.hanzi,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 64,
              fontWeight: FontWeight.w800,
              color: AppColors.ink,
            ),
          ),
          const SizedBox(height: 12),
          ToneColoredPinyin(
            pinyin: word.pinyin,
            fontSize: 22,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          SpeakButton(text: word.hanzi, size: 52),
          const SizedBox(height: 20),
          Text(
            'Tap to reveal meaning',
            style: TextStyle(fontSize: 13, color: AppColors.muted),
          ),
        ],
      ),
    );
  }

  Widget _buildBack(Word word) {
    return Container(
      key: const ValueKey('back'),
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.paper,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.gold.withValues(alpha: 0.5)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            word.english,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: AppColors.ink,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            word.hanzi,
            style: TextStyle(fontSize: 22, color: AppColors.muted),
          ),
          const SizedBox(height: 8),
          ToneColoredPinyin(pinyin: word.pinyin, fontSize: 16, textAlign: TextAlign.center),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        word.exampleHanzi,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.ink,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    SpeakButton(text: word.exampleHanzi, size: 34),
                  ],
                ),
                const SizedBox(height: 4),
                ToneColoredPinyin(pinyin: word.examplePinyin, fontSize: 13),
                const SizedBox(height: 4),
                Text(
                  word.exampleEnglish,
                  style: TextStyle(fontSize: 13, color: AppColors.muted),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SpeakButton(text: word.hanzi),
        ],
      ),
    );
  }

  Widget _buildSummary() {
    final total = widget.words.length;
    final firstTry = _firstTryCorrect.length;
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          Icon(
            firstTry == total ? Icons.emoji_events : Icons.thumb_up,
            size: 72,
            color: AppColors.gold,
          ),
          const SizedBox(height: 16),
          Text(
            'Session complete',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: AppColors.ink),
          ),
          const SizedBox(height: 8),
          Text(
            'You knew $firstTry of $total words on the first try.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: AppColors.muted),
          ),
          if (_needsReview.isNotEmpty) ...[
            const SizedBox(height: 24),
            Text(
              'Review these words again:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.ink,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final word in widget.words)
                  if (_needsReview.contains(word.id))
                    Chip(
                      avatar: const Icon(Icons.refresh, size: 16, color: AppColors.red),
                      label: Text('${word.hanzi}  ${word.english}'),
                    ),
              ],
            ),
          ],
          const Spacer(),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }
}

/// A simple Y-axis flip animation for the card.
class RotationYTransition extends StatelessWidget {
  const RotationYTransition({
    super.key,
    required this.animation,
    required this.child,
  });

  final Animation<double> animation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (context, child) {
        final angle = animation.value * pi;
        final isUnder = angle > pi / 2;
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(angle),
          child: isUnder
              ? Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()..rotateY(pi),
                  child: child,
                )
              : child,
        );
      },
    );
  }
}
