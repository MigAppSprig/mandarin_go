import 'package:flutter/material.dart';

import '../services/pinyin_utils.dart';
import '../theme/app_theme.dart';

/// Renders space-separated pinyin, colouring each syllable by its tone so
/// learners can see the pitch contour at a glance.
class ToneColoredPinyin extends StatelessWidget {
  const ToneColoredPinyin({
    super.key,
    required this.pinyin,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.start,
  });

  final String pinyin;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    final syllables = pinyin.split(RegExp(r'\s+')).where((s) => s.isNotEmpty);
    final spans = <TextSpan>[];
    for (final s in syllables) {
      if (spans.isNotEmpty) {
        spans.add(TextSpan(text: ' '));
      }
      final tone = PinyinUtils.toneOf(s);
      final color = AppColors.toneColors[tone] ?? AppColors.muted;
      spans.add(
        TextSpan(text: s, style: TextStyle(color: color)),
      );
    }
    return Text.rich(
      TextSpan(children: spans),
      textAlign: textAlign,
      style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}
