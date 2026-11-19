import 'dart:math';

import 'package:flutter/material.dart';

import '../services/pinyin_utils.dart';
import '../services/tts_service.dart';
import '../theme/app_theme.dart';

/// A tone-recognition drill: hear and read a syllable, then pick its tone.
class PinyinQuizScreen extends StatefulWidget {
  const PinyinQuizScreen({super.key});

  @override
  State<PinyinQuizScreen> createState() => _PinyinQuizScreenState();
}

class _QuizItem {
  const _QuizItem(this.syllable, this.hanzi, this.meaning, this.tone);

  final String syllable; // tone-marked
  final String hanzi;
  final String meaning;
  final int tone; // 1-4 or 0
}

const List<_QuizItem> _items = <_QuizItem>[
  _QuizItem('mā', '妈', 'mother', 1),
  _QuizItem('má', '麻', 'hemp', 2),
  _QuizItem('mǎ', '马', 'horse', 3),
  _QuizItem('mà', '骂', 'to scold', 4),
  _QuizItem('bā', '八', 'eight', 1),
  _QuizItem('dà', '大', 'big', 4),
  _QuizItem('nǐ', '你', 'you', 3),
  _QuizItem('hǎo', '好', 'good', 3),
  _QuizItem('shì', '是', 'to be', 4),
  _QuizItem('chá', '茶', 'tea', 2),
  _QuizItem('èr', '二', 'two', 4),
  _QuizItem('sān', '三', 'three', 1),
  _QuizItem('wǔ', '五', 'five', 3),
  _QuizItem('jiǔ', '九', 'nine', 3),
  _QuizItem('shí', '十', 'ten', 2),
  _QuizItem('rén', '人', 'person', 2),
  _QuizItem('xué', '学', 'to learn', 2),
  _QuizItem('shū', '书', 'book', 1),
  _QuizItem('shuǐ', '水', 'water', 3),
  _QuizItem('rè', '热', 'hot', 4),
  _QuizItem('ài', '爱', 'love', 4),
  _QuizItem('máng', '忙', 'busy', 2),
  _QuizItem('guì', '贵', 'expensive', 4),
  _QuizItem('qián', '钱', 'money', 2),
  _QuizItem('ma', '吗', 'question particle', 0),
  _QuizItem('ne', '呢', 'and you?', 0),
];

class _PinyinQuizScreenState extends State<PinyinQuizScreen> {
  static const int _roundSize = 10;

  late List<_QuizItem> _round;
  int _index = 0;
  int _score = 0;
  int? _selectedTone;
  bool _finished = false;

  @override
  void initState() {
    super.initState();
    _startRound();
  }

  void _startRound() {
    final shuffled = List<_QuizItem>.from(_items)..shuffle(Random());
    _round = shuffled.take(_roundSize).toList();
    _index = 0;
    _score = 0;
    _selectedTone = null;
    _finished = false;
  }

  void _answer(int tone) {
    if (_selectedTone != null) return;
    setState(() {
      _selectedTone = tone;
      if (tone == _round[_index].tone) _score++;
    });
  }

  void _next() {
    setState(() {
      if (_index + 1 >= _round.length) {
        _finished = true;
      } else {
        _index++;
        _selectedTone = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tone Practice')),
      body: _finished ? _buildSummary(context) : _buildQuestion(context),
    );
  }

  Widget _buildQuestion(BuildContext context) {
    final item = _round[_index];
    final answered = _selectedTone != null;
    final correct = _selectedTone == item.tone;

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
                style: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.jade),
              ),
            ],
          ),
          const SizedBox(height: 12),
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
                  item.hanzi,
                  style: const TextStyle(
                    fontSize: 72,
                    fontWeight: FontWeight.w800,
                    color: AppColors.ink,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${PinyinUtils.stripToneMarks(item.syllable)} · ${item.meaning}',
                  style: TextStyle(fontSize: 18, color: AppColors.muted),
                ),
                const SizedBox(height: 20),
                FilledButton.icon(
                  onPressed: () => TtsService.instance.speak(item.hanzi),
                  icon: const Icon(Icons.volume_up_rounded),
                  label: const Text('Listen'),
                ),
              ],
            ),
          ),
          const Spacer(),
          Text(
            'Which tone does it have?',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.ink),
          ),
          const SizedBox(height: 12),
          _buildToneOptions(context, item, answered, correct),
          const SizedBox(height: 20),
          if (answered)
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              child: FilledButton(
                onPressed: _next,
                style: FilledButton.styleFrom(
                  backgroundColor: correct ? AppColors.jade : AppColors.red,
                ),
                child: Text(_index + 1 >= _round.length ? 'See results' : 'Next'),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildToneOptions(
    BuildContext context,
    _QuizItem item,
    bool answered,
    bool correct,
  ) {
    final labels = <String>['1st  ¯', '2nd  ´', '3rd  ˇ', '4th  `', 'neutral'];
    final tones = <int>[1, 2, 3, 4, 0];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (var i = 0; i < tones.length; i++)
          _toneOption(context, tones[i], labels[i], item, answered, correct),
      ],
    );
  }

  Widget _toneOption(
    BuildContext context,
    int tone,
    String label,
    _QuizItem item,
    bool answered,
    bool correct,
  ) {
    final color = AppColors.toneColors[tone]!;
    final isSelected = _selectedTone == tone;
    final isCorrectAnswer = item.tone == tone;

    Color bg;
    Color fg;
    if (!answered) {
      bg = color.withValues(alpha: 0.12);
      fg = color;
    } else if (isCorrectAnswer) {
      bg = AppColors.jade;
      fg = Colors.white;
    } else if (isSelected) {
      bg = AppColors.red;
      fg = Colors.white;
    } else {
      bg = color.withValues(alpha: 0.08);
      fg = color.withValues(alpha: 0.5);
    }

    return InkWell(
      onTap: answered ? null : () => _answer(tone),
      borderRadius: BorderRadius.circular(14),
      child: Container(
        width: 60,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(14),
          border: isSelected && !answered ? Border.all(color: color, width: 2) : null,
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: fg,
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _buildSummary(BuildContext context) {
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
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: AppColors.ink),
          ),
          const SizedBox(height: 8),
          Text(
            percent >= 80
                ? 'Great job! Your ears are tuning in to the tones.'
                : 'Tones take practice — give it another round!',
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
            child: const Text('Back to Pinyin'),
          ),
        ],
      ),
    );
  }
}
