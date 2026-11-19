import 'package:flutter/material.dart';

import '../services/tts_service.dart';

/// A round button that speaks [text] aloud using the device's Mandarin voice.
///
/// Pass [onTap] to override the default text-to-speech behaviour (for example,
/// to play a bundled audio clip instead).
class SpeakButton extends StatelessWidget {
  const SpeakButton({
    super.key,
    required this.text,
    this.size = 42,
    this.color,
    this.onTap,
  });

  final String text;
  final double size;
  final Color? color;

  /// Custom action. When null, the button speaks [text] via TTS.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final effective = color ?? Theme.of(context).colorScheme.primary;
    return Material(
      color: effective.withValues(alpha: 0.14),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap ?? () => TtsService.instance.speak(text),
        child: SizedBox(
          width: size,
          height: size,
          child: Icon(
            Icons.volume_up_rounded,
            size: size * 0.55,
            color: effective,
          ),
        ),
      ),
    );
  }
}
