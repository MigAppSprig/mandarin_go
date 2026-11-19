/// A single line in a dialogue.
class DialogueLine {
  const DialogueLine({
    required this.hanzi,
    required this.pinyin,
    required this.english,
  });

  final String hanzi;
  final String pinyin;
  final String english;
}

/// A short, real-life conversation for beginners.
class Dialogue {
  const Dialogue({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.emoji,
    required this.lines,
  });

  final String id;
  final String title;

  /// One-line description of the situation.
  final String subtitle;

  final String emoji;

  /// Ordered list of alternating speakers (the speaker name is derived from
  /// the position: even index = Person A, odd index = Person B).
  final List<DialogueLine> lines;
}
