import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/app_theme.dart';

/// About & contact page: basic app/website info plus a feedback channel.
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static const String feedbackEmail = 'migapp.developer@gmail.com';

  Future<void> _sendEmail(BuildContext context) async {
    final uri = Uri(
      scheme: 'mailto',
      path: feedbackEmail,
      query: 'subject=${Uri.encodeComponent('MandarinGo Feedback')}',
    );
    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (_) {
      if (context.mounted) {
        await _copyEmail(context);
      }
    }
  }

  Future<void> _copyEmail(BuildContext context) async {
    await Clipboard.setData(const ClipboardData(text: feedbackEmail));
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email copied to clipboard.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About & Contact')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 32),
        children: [
          _buildHeader(context),
          _buildFeatures(context),
          _buildContact(context),
          _buildFooter(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 88,
          height: 88,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.red, AppColors.deepRed],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(24),
          ),
          child: const Text(
            '中',
            style: TextStyle(
              fontSize: 44,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'MandarinGo',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w800,
            color: AppColors.ink,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '学中文 · Learn Chinese',
          style: TextStyle(fontSize: 15, color: AppColors.muted),
        ),
        const SizedBox(height: 4),
        Text(
          'Version 1.0.0',
          style: TextStyle(fontSize: 13, color: AppColors.muted),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            'A beginner-friendly Mandarin learning app for English speakers — '
            'available on iOS, Android and the web.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              color: AppColors.muted,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFeatures(BuildContext context) {
    const features = [
      ('拼音基础', 'Pinyin basics — tones, initials & finals with a complete chart'),
      ('声调练习', 'Tone practice quiz'),
      ('词卡', '350+ flashcards with spaced repetition'),
      ('对话', 'Real-life dialogues with audio'),
      ('翻译', 'English → Chinese translator'),
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Features',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: AppColors.ink,
              ),
            ),
            const SizedBox(height: 12),
            for (final (zh, en) in features)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.check_circle, size: 18, color: AppColors.jade),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        '$zh  ·  $en',
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.4,
                          color: AppColors.muted,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildContact(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Feedback & Contact',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: AppColors.ink,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Have a question, found a bug, or want to suggest a feature? '
              "We'd love to hear from you — please email us at:",
              style: TextStyle(
                fontSize: 14,
                height: 1.5,
                color: AppColors.muted,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.red.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.red.withValues(alpha: 0.2)),
              ),
              child: Row(
                children: [
                  Icon(Icons.alternate_email, color: AppColors.red),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      feedbackEmail,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.red,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.copy, size: 20),
                    color: AppColors.muted,
                    tooltip: 'Copy email',
                    onPressed: () => _copyEmail(context),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () => _sendEmail(context),
                icon: const Icon(Icons.email_outlined),
                label: const Text('Send Feedback Email'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Text(
        'Thank you for learning with MandarinGo!',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 13, color: AppColors.muted),
      ),
    );
  }
}
