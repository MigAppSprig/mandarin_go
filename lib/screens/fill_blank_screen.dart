import 'dart:math';

import 'package:flutter/material.dart';

import '../data/vocabulary_examples.dart';
import '../models/vocabulary.dart';
import '../theme/app_theme.dart';
import '../widgets/speak_button.dart';
import '../widgets/tone_colored_pinyin.dart';

/// Fill-in-the-blank drill: an example sentence with the target word removed,
/// plus four word choices.
class FillBlankScreen extends StatefulWidget {
  const FillBlankScreen({
    super.key,
    required this.words,
    required this.title,
  });

  final List<Word> words;
  final String title;

  @override
  State<FillBlankScreen> createState() => _FillBlankScreenState();
}

class _BlankQuestion {
  const _BlankQuestion(this.word, this.example, this.sentence);

  final Word word;
  final WordExample example;
  final String sentence;
}

class _FillBlankScreenState extends State<FillBlankScreen> {
  static const int _roundSize = 10;

  late List<_BlankQuestion> _round;
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

  _BlankQuestion? _questionFor(Word word) {
    for (final example in VocabularyExamples.forWord(word)) {
      if (example.hanzi.contains(word.hanzi) && example.hanzi.length > word.hanzi.length) {
        return _BlankQuestion(
          word,
          example,
          example.hanzi.replaceFirst(word.hanzi, '＿＿'),
        );
      }
    }
    return null;
  }

  void _startRound() {
    final questions = <_BlankQuestion>[];
    for (final word in widget.words) {
      final q = _questionFor(word);
      if (q != null) questions.add(q);
    }
    questions.shuffle(Random());
    _round = questions.take(_roundSize).toList();
    _index = 0;
    _score = 0;
    _selected = null;
    _finished = _round.isEmpty;
    if (_round.isNotEmpty) _prepareOptions();
  }

  void _prepareOptions() {
    final correct = _round[_index].word.hanzi;
    final others = widget.words
        .where((w) => w.hanzi != correct)
        .map((w) => w.hanzi)
        .toSet()
        .toList()
      ..shuffle(Random());
    final options = <String>[correct, ...others.take(3)]..shuffle(Random());
    _options = options;
  }

  void _answer(String option) {
    if (_selected != null) return;
    setState(() {
      _selected = option;
      if (option == _round[_index].word.hanzi) _score++;
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
    if (_finished && _round.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text('Fill the blank · ${widget.title}')),
        body: const Center(child: Text('Not enough example sentences in this scope.')),
      );
    }
    return Scaffold(
      appBar: AppBar(title: Text('Fill the blank · ${widget.title}')),
      body: _finished ? _buildSummary() : _buildQuestion(),
    );
  }

  Widget _buildQuestion() {
    final q = _round[_index];
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
          const SizedBox(height: 28),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: AppColors.gold.withValues(alpha: 0.4)),
            ),
            child: Column(
              children: [
                Text(
                  'Choose the word that fills the blank:',
                  style: TextStyle(fontSize: 13, color: AppColors.muted),
                ),
                const SizedBox(height: 14),
                Text(
                  answered ? q.example.hanzi : q.sentence,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    height: 1.5,
                    color: AppColors.ink,
                  ),
                ),
                if (answered) ...[
                  const SizedBox(height: 8),
                  ToneColoredPinyin(pinyin: q.example.pinyin, fontSize: 15, textAlign: TextAlign.center),
                  const SizedBox(height: 6),
                  Text(
                    q.example.english,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13, color: AppColors.muted),
                  ),
                  const SizedBox(height: 10),
                  SpeakButton(text: q.example.hanzi, size: 40),
                ],
              ],
            ),
          ),
          const SizedBox(height: 20),
          for (final option in _options)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _optionButton(option, q.word.hanzi, answered),
            ),
          if (answered)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: FilledButton(
                onPressed: _next,
                style: FilledButton.styleFrom(
                  backgroundColor:
                      _selected == q.word.hanzi ? AppColors.jade : AppColors.red,
                ),
                child: Text(_index + 1 >= _round.length ? 'See results' : 'Next'),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                'Tip: the blank hides one word from the sentence.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: AppColors.muted),
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
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: border, width: 1.5),
        ),
        child: Text(
          option,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
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
                ? 'Nicely done — you can pick the right word in context!'
                : 'Sentence context takes practice — try again!',
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
