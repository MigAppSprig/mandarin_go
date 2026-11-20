import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/app_theme.dart';

/// Community / social-media page to help learners find each other.
class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  /// Replace these with the exact URLs when available.
  static const String facebookGroupUrl =
      'https://www.facebook.com/search/groups/?q=Learning%20Mandarin%20with%20Martin';
  static const String youtubeUrl = 'https://www.youtube.com/@LearnMandarinwithMartin';
  static const String helloTalkUrl = 'https://hellotalk.com/@LChinese_wMartin';

  Future<void> _open(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    try {
      final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!ok && context.mounted) {
        _showCopyHint(context, url);
      }
    } catch (_) {
      if (context.mounted) _showCopyHint(context, url);
    }
  }

  void _showCopyHint(BuildContext context, String url) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Could not open the link. Copy it: $url')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Community')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
        children: [
          _buildHero(),
          const SizedBox(height: 16),
          _buildPrompt(),
          const SizedBox(height: 8),
          _socialCard(
            context,
            emoji: '📘',
            platform: 'Facebook Group',
            handle: 'Learning Mandarin with Martin',
            description: 'Join our main community hub for free!',
            color: const Color(0xFF1877F2),
            url: facebookGroupUrl,
          ),
          _socialCard(
            context,
            emoji: '▶️',
            platform: 'YouTube Channel',
            handle: '@LearnMandarinwithMartin',
            description:
                'Follow Martin to Learn Mandarin — subscribe for video lessons & clips!',
            color: const Color(0xFFE53935),
            url: youtubeUrl,
          ),
          _socialCard(
            context,
            emoji: '💬',
            platform: 'HelloTalk',
            handle: '@LChinese_wMartin',
            description:
                'Special note: I will be hosting regular Live Voice/Video Rooms.',
            color: AppColors.jade,
            url: helloTalkUrl,
          ),
          const SizedBox(height: 8),
          _buildClosing(),
        ],
      ),
    );
  }

  Widget _buildHero() {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.deepRed, AppColors.red],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.red.withValues(alpha: 0.30),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text('🌏', style: TextStyle(fontSize: 32)),
              SizedBox(width: 10),
              Text(
                'Learning together',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            'Learning a new language, a new group of people, as well as '
            'meeting a different culture would always enrich our lives. The '
            'journey alone sometimes could be helpless and lack of warmth.',
            style: TextStyle(
              fontSize: 14,
              height: 1.55,
              color: Colors.white.withValues(alpha: 0.95),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrompt() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.gold.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.gold.withValues(alpha: 0.35)),
      ),
      child: Row(
        children: [
          const Text('🤝', style: TextStyle(fontSize: 26)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Want to find other Mandarin lovers and practice together?',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                height: 1.35,
                color: AppColors.ink,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialCard(
    BuildContext context, {
    required String emoji,
    required String platform,
    required String handle,
    required String description,
    required Color color,
    required String url,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: color.withValues(alpha: 0.25)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: () => _open(context, url),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text(emoji, style: const TextStyle(fontSize: 24)),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        platform,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.3,
                          color: color,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        handle,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.ink,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 13,
                          height: 1.4,
                          color: AppColors.muted,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 6),
                Icon(Icons.open_in_new, size: 18, color: color),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildClosing() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.paper,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.paperDark),
      ),
      child: Column(
        children: [
          Text(
            "Let's jointly build the positive learning and supporting "
            'community together!',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              height: 1.45,
              color: AppColors.ink,
            ),
          ),
          const SizedBox(height: 14),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
            decoration: BoxDecoration(
              color: AppColors.red.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              children: [
                const Text(
                  '📅 Every Monday and Thursday on HelloTalk',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: AppColors.red,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  '不见不散！（Bù jiàn bú sàn!）',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: AppColors.ink,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Be there or be square — looking forward to seeing you!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: AppColors.muted),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
