import 'package:flutter/material.dart';

import '../data/pinyin_data.dart';
import '../theme/app_theme.dart';

class PinyinRulesScreen extends StatelessWidget {
  const PinyinRulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tone-change Rules')),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 24),
        itemCount: PinyinData.toneRules.length,
        itemBuilder: (context, index) {
          final rule = PinyinData.toneRules[index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.red.withValues(alpha: 0.12),
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            color: AppColors.red,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          rule['title']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.ink,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    rule['rule']!,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: AppColors.muted,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
