import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/progress_controller.dart';
import '../services/tts_service.dart';
import '../theme/app_theme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double _rate = TtsService.instance.rate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 24),
        children: [
          _buildSectionHeader('Speech'),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.speed, color: AppColors.jade),
                      const SizedBox(width: 8),
                      const Text(
                        'Speech speed',
                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                      const Spacer(),
                      Text(
                        '${(_rate * 100).round()}%',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: AppColors.jade,
                        ),
                      ),
                    ],
                  ),
                  Slider(
                    value: _rate,
                    min: 0.25,
                    max: 0.75,
                    divisions: 10,
                    label: '${(_rate * 100).round()}%',
                    onChanged: (v) => setState(() => _rate = v),
                    onChangeEnd: (v) {
                      TtsService.instance.setRate(v);
                      TtsService.instance.speak('你好，学中文');
                    },
                  ),
                  Text(
                    'A slower speed is easier to follow while learning. '
                    'Tap the slider to hear a sample.',
                    style: TextStyle(fontSize: 13, color: AppColors.muted),
                  ),
                ],
              ),
            ),
          ),
          _buildSectionHeader('Data'),
          Card(
            child: ListTile(
              leading: const Icon(Icons.delete_outline, color: AppColors.red),
              title: const Text('Reset learning progress'),
              subtitle: const Text('Clears flashcards and learned words'),
              onTap: _confirmReset,
            ),
          ),
          _buildSectionHeader('About'),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'MandarinGo',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'A beginner-friendly Mandarin learning app for English speakers.',
                    style: TextStyle(fontSize: 14, color: AppColors.muted),
                  ),
                  SizedBox(height: 12),
                  Text(
                    '• Pinyin tones, initials and finals\n'
                    '• Spaced-repetition flashcards\n'
                    '• Real-life dialogues with audio\n'
                    '• Offline English → Chinese dictionary',
                    style: TextStyle(fontSize: 13, height: 1.6, color: AppColors.muted),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 4),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
          color: AppColors.muted,
        ),
      ),
    );
  }

  Future<void> _confirmReset() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reset progress?'),
        content: const Text(
          'This will erase all flashcards progress and learned words. '
          'This cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: FilledButton.styleFrom(backgroundColor: AppColors.red),
            child: const Text('Reset'),
          ),
        ],
      ),
    );

    if (confirmed != true || !mounted) return;
    await context.read<ProgressController>().resetProgress();
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Progress reset.')),
    );
  }
}
