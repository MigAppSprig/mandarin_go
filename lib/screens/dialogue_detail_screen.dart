import 'package:flutter/material.dart';

import '../models/dialogue.dart';
import '../theme/app_theme.dart';
import '../widgets/speak_button.dart';
import '../widgets/tone_colored_pinyin.dart';

class DialogueDetailScreen extends StatefulWidget {
  const DialogueDetailScreen({super.key, required this.dialogue});

  final Dialogue dialogue;

  @override
  State<DialogueDetailScreen> createState() => _DialogueDetailScreenState();
}

class _DialogueDetailScreenState extends State<DialogueDetailScreen> {
  bool _showPinyin = true;
  bool _showEnglish = true;

  @override
  Widget build(BuildContext context) {
    final d = widget.dialogue;
    return Scaffold(
      appBar: AppBar(title: Text(d.title)),
      body: Column(
        children: [
          _buildToolbar(context),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 24),
              itemCount: d.lines.length,
              itemBuilder: (context, index) {
                final line = d.lines[index];
                final isA = index.isEven;
                return _buildLine(context, line, isA);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToolbar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.dialogue.subtitle,
              style: TextStyle(fontSize: 13, color: AppColors.muted),
            ),
          ),
          FilterChip(
            label: const Text('Pinyin'),
            selected: _showPinyin,
            onSelected: (v) => setState(() => _showPinyin = v),
            visualDensity: VisualDensity.compact,
          ),
          const SizedBox(width: 8),
          FilterChip(
            label: const Text('English'),
            selected: _showEnglish,
            onSelected: (v) => setState(() => _showEnglish = v),
            visualDensity: VisualDensity.compact,
          ),
        ],
      ),
    );
  }

  Widget _buildLine(BuildContext context, DialogueLine line, bool isA) {
    final accent = isA ? AppColors.red : AppColors.gold;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: accent,
              shape: BoxShape.circle,
            ),
            child: Text(
              isA ? 'A' : 'B',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 13,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: accent.withValues(alpha: 0.25)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          line.hanzi,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.ink,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      SpeakButton(text: line.hanzi, size: 36, color: accent),
                    ],
                  ),
                  if (_showPinyin) ...[
                    const SizedBox(height: 6),
                    ToneColoredPinyin(pinyin: line.pinyin, fontSize: 14),
                  ],
                  if (_showEnglish) ...[
                    const SizedBox(height: 4),
                    Text(
                      line.english,
                      style: TextStyle(fontSize: 13, color: AppColors.muted),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
