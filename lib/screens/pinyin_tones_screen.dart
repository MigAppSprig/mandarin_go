import 'package:flutter/material.dart';

import '../data/pinyin_data.dart';
import '../theme/app_theme.dart';
import '../widgets/speak_button.dart';

class PinyinTonesScreen extends StatelessWidget {
  const PinyinTonesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('The Four Tones')),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 24),
        itemCount: PinyinData.tones.length,
        itemBuilder: (context, index) {
          final tone = PinyinData.tones[index];
          final color = AppColors.toneColors[tone.number]!;
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 46,
                        height: 46,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: color.withValues(alpha: 0.14),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          tone.number == 0 ? '·' : '${tone.number}',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: color,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${tone.englishName}  ${tone.chineseName}',
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: AppColors.ink,
                              ),
                            ),
                            Text(
                              'contour ${tone.contour}',
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.muted,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    tone.description,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.45,
                      color: AppColors.muted,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColors.paper,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    tone.exampleHanzi,
                                    style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.ink,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 4),
                                    child: Text(
                                      tone.exampleSyllable,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: color,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                tone.exampleMeaning,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.muted,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SpeakButton(
                          text: tone.exampleHanzi,
                          color: color,
                        ),
                      ],
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
