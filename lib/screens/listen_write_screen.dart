import 'dart:math';

import 'package:flutter/material.dart';

import '../models/vocabulary.dart';
import '../services/pinyin_utils.dart';
import '../services/tts_service.dart';
import '../theme/app_theme.dart';
import '../widgets/tone_colored_pinyin.dart';

/// A dictation drill: listen to a word, then type its pinyin.
///
/// Tone marks are optional — input is compared tone-insensitively, so
/// "ni hao", "nihao" and "nǐ hǎo" are all accepted.
class ListenWriteScreen extends StatefulWidget {
  const ListenWriteScreen({
    super.key,
    required this.words,
    required this.title,
  });

  final List<Word> words;
  final String title;

  @override
  State<ListenWriteScreen> createState() => _ListenWriteScreenState();
}

class _ListenWriteScreenState extends State<ListenWriteScreen> {
  static const int _roundSize = 10;

  late List<Word> _round;
  final TextEditingController _controller = TextEditingController();
  int _index = 0;
  int _score = 0;
  bool _submitted = false;
  bool _correct = false;
  bool _finished = false;

  @override
  void initState() {
    super.initState();
    _startRound();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startRound() {
    final pool = List<Word>.from(widget.words)..shuffle(Random());
    _round = pool.take(_roundSize).toList();
    _index = 0;
    _score = 0;
    _submitted = false;
    _correct = false;
    _finished = false;
    _controller.clear();
  }

  String _normalize(String s) {
    final noTone = PinyinUtils.stripToneMarks(s.toLowerCase());
    return noTone.replaceAll(RegExp('[^a-zü]'), '');
  }

  void _submit() {
    if (_submitted) return;
    final word = _round[_index];
    final input = _normalize(_controller.text);
    if (input.isEmpty) return;
    final isCorrect = input == _normalize(word.pinyin);
    setState(() {
      _submitted = true;
      _correct = isCorrect;
      if (isCorrect) _score++;
    });
  }

  void _next() {
    setState(() {
      if (_index + 1 >= _round.length) {
        _finished = true;
      } else {
        _index++;
        _submitted = false;
        _correct = false;
        _controller.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pinyin dictation · ${widget.title}')),
      body: _finished ? _buildSummary() : _buildQuestion(),
    );
  }

  Widget _buildQuestion() {
    final word = _round[_index];
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
          Center(
            child: Column(
              children: [
                const Text(
                  'Listen and write the pinyin',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.ink,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Tones are optional (e.g. "ni hao" or "nǐ hǎo")',
                  style: TextStyle(fontSize: 12, color: AppColors.muted),
                ),
                const SizedBox(height: 20),
                Material(
                  color: AppColors.red,
                  shape: const CircleBorder(),
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () => TtsService.instance.speak(word.hanzi),
                    child: const SizedBox(
                      width: 96,
                      height: 96,
                      child: Icon(
                        Icons.volume_up_rounded,
                        size: 48,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                TextButton.icon(
                  onPressed: () => TtsService.instance.speak(word.hanzi),
                  icon: const Icon(Icons.replay, size: 18),
                  label: const Text('Play again'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          TextField(
            controller: _controller,
            enabled: !_submitted,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => _submit(),
            autocorrect: false,
            enableSuggestions: false,
            decoration: InputDecoration(
              hintText: 'Type pinyin…',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 12),
          if (!_submitted)
            FilledButton(
              onPressed: _submit,
              child: const Text('Check'),
            )
          else
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _correct
                    ? AppColors.jade.withValues(alpha: 0.12)
                    : AppColors.red.withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: _correct ? AppColors.jade : AppColors.red,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        _correct ? Icons.check_circle : Icons.cancel,
                        color: _correct ? AppColors.jade : AppColors.red,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _correct ? 'Correct!' : 'Not quite',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: _correct ? AppColors.jade : AppColors.red,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        word.hanzi,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: AppColors.ink,
                        ),
                      ),
                      const SizedBox(width: 10),
                      ToneColoredPinyin(
                        pinyin: word.pinyin,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    word.english,
                    style: TextStyle(fontSize: 14, color: AppColors.muted),
                  ),
                  const SizedBox(height: 10),
                  FilledButton(
                    onPressed: _next,
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.jade,
                    ),
                    child: Text(
                      _index + 1 >= _round.length ? 'See results' : 'Next',
                    ),
                  ),
                ],
              ),
            ),
        ],
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
                ? 'Great listening! Your pinyin is getting solid.'
                : 'Dictation is hard — keep listening and trying!',
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
