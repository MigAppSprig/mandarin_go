import 'dart:math';

import 'package:flutter/material.dart';

import '../models/vocabulary.dart';
import '../services/pinyin_confusion.dart';
import '../theme/app_theme.dart';
import '../widgets/speak_button.dart';

/// A multiple-choice drill: see a word, pick the correct pinyin from
/// similar-sounding distractors.
class PinyinDiscriminationScreen extends StatefulWidget {
  const PinyinDiscriminationScreen({
    super.key,
    required this.words,
    required this.title,
  });

  final List<Word> words;
  final String title;

  @override
  State<PinyinDiscriminationScreen> createState() =>
      _PinyinDiscriminationScreenState();
}

class _PinyinDiscriminationScreenState
    extends State<PinyinDiscriminationScreen> {
  static const int _roundSize = 10;

  late List<Word> _round;
  late List<String> _options;
  int _index = 0;
  int _score = 0;
  String? _selected;
  bool _finished = false;

  @override
  void initState() {
    super.initState();
    _startRound();
  }

  void _startRound() {
    final pool = List<Word>.from(widget.words)..shuffle(Random());
    _round = pool.take(_roundSize).toList();
    _index = 0;
    _score = 0;
    _selected = null;
    _finished = false;
    _prepareOptions();
  }

  void _prepareOptions() {
    final word = _round[_index];
    final options = <String>[
      word.pinyin,
      ...PinyinConfusion.options(word.pinyin),
    ];
    options.shuffle(Random());
    _options = options;
  }

  void _answer(String option) {
    if (_selected != null) return;
    setState(() {
      _selected = option;
      if (option == _round[_index].pinyin) _score++;
    });
  }

  void _next() {
    setState(() {
      if (_index + 1 >= _round.length) {
        _finished = true;
      } else {
        _index++;
        _selected = null;
        _prepareOptions();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pinyin · ${widget.title}')),
      body: _finished ? _buildSummary() : _buildQuestion(),
    );
  }

  Widget _buildQuestion() {
    final word = _round[_index];
    final answered = _selected != null;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Question ${_index + 1} / ${_round.length}',
                style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.muted),
              ),
              Text(
                'Score: $_score',
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.jade,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            value: _index / _round.length,
            minHeight: 8,
            borderRadius: BorderRadius.circular(4),
            backgroundColor: AppColors.paperDark,
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.jade),
          ),
          const Spacer(),
          Center(
            child: Column(
              children: [
                Text(
                  word.hanzi,
                  style: const TextStyle(
                    fontSize: 72,
                    fontWeight: FontWeight.w800,
                    color: AppColors.ink,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  word.english,
                  style: TextStyle(fontSize: 18, color: AppColors.muted),
                ),
                const SizedBox(height: 16),
                SpeakButton(text: word.hanzi, size: 52),
              ],
            ),
          ),
          const Spacer(),
          Text(
            'Which pinyin is correct?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.ink,
            ),
          ),
          const SizedBox(height: 12),
          for (final option in _options)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _optionButton(option, word.pinyin, answered),
            ),
          if (answered)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: FilledButton(
                onPressed: _next,
                style: FilledButton.styleFrom(
                  backgroundColor:
                      _selected == word.pinyin ? AppColors.jade : AppColors.red,
                ),
                child: Text(_index + 1 >= _round.length ? 'See results' : 'Next'),
              ),
            ),
        ],
      ),
    );
  }

  Widget _optionButton(String option, String correct, bool answered) {
    final isCorrect = option == correct;
    final isSelected = option == _selected;
    Color background = Colors.white;
    Color border = AppColors.paperDark;
    Color text = AppColors.ink;

    if (answered) {
      if (isCorrect) {
        background = AppColors.jade;
        border = AppColors.jade;
        text = Colors.white;
      } else if (isSelected) {
        background = AppColors.red;
        border = AppColors.red;
        text = Colors.white;
      }
    }

    return InkWell(
      onTap: answered ? null : () => _answer(option),
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: border, width: 1.5),
        ),
        child: Text(
          option,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: text,
          ),
        ),
      ),
    );
  }

  Widget _buildSummary() {
    final percent = (_score / _round.length * 100).round();
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(
            percent >= 80 ? Icons.emoji_events : Icons.school,
            size: 80,
            color: percent >= 80 ? AppColors.gold : AppColors.jade,
          ),
          const SizedBox(height: 16),
          Text(
            'You got $_score out of ${_round.length}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: AppColors.ink,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            percent >= 80
                ? 'Excellent ear — those similar sounds did not fool you!'
                : 'Keep practising: similar sounds are the hardest part.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: AppColors.muted),
          ),
          const SizedBox(height: 32),
          FilledButton(
            onPressed: () => setState(_startRound),
            child: const Text('Practice again'),
          ),
          const SizedBox(height: 12),
          OutlinedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Back to Practice'),
          ),
        ],
      ),
    );
  }
}
