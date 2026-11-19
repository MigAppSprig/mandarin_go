import 'package:flutter/material.dart';

import '../data/dialogue_data.dart';
import '../theme/app_theme.dart';
import 'dialogue_detail_screen.dart';

class DialoguesScreen extends StatelessWidget {
  const DialoguesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dialogues')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 24),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
            child: Text(
              'Practice real conversations. Tap any line to hear it spoken, '
              'and try shadowing — repeat aloud right after the speaker.',
              style: TextStyle(fontSize: 14, height: 1.5, color: AppColors.muted),
            ),
          ),
          for (final dialogue in DialogueData.all)
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => DialogueDetailScreen(dialogue: dialogue),
                    ),
                  );
                },
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                leading: Text(dialogue.emoji, style: const TextStyle(fontSize: 28)),
                title: Text(
                  dialogue.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: AppColors.ink,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(dialogue.subtitle),
                ),
                trailing: const Icon(Icons.chevron_right),
              ),
            ),
        ],
      ),
    );
  }
}
