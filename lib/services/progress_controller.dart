import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Holds the learner's progress and persists it locally.
///
/// Flashcards use a simple Leitner-style box system: each word starts in box 0
/// and moves up to box 5 as the user answers it correctly. Marking a word wrong
/// drops it back to box 0 so it is reviewed again soon.
class ProgressController extends ChangeNotifier {
  static const String _learnedKey = 'learned_words';
  static const String _boxesKey = 'word_boxes';

  final Set<String> _learned = <String>{};
  final Map<String, int> _boxes = <String, int>{};
  bool _loaded = false;

  bool get isLoaded => _loaded;
  int get learnedCount => _learned.length;
  int get knownCount => _learned.length;

  bool isLearned(String id) => _learned.contains(id);

  /// Current SRS box (0..5) for a word. 5 means mastered.
  int boxOf(String id) => _boxes[id] ?? 0;

  /// Total number of words that have ever been seen (have a non-zero box or
  /// are marked learned).
  int get seenCount => _boxes.keys.toSet().union(_learned).length;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    _learned
      ..clear()
      ..addAll(prefs.getStringList(_learnedKey) ?? const <String>[]);

    final boxesJson = prefs.getString(_boxesKey);
    if (boxesJson != null && boxesJson.isNotEmpty) {
      final decoded = jsonDecode(boxesJson) as Map<String, dynamic>;
      _boxes
        ..clear()
        ..addEntries(
          decoded.entries.map(
            (e) => MapEntry(e.key, (e.value as num).toInt()),
          ),
        );
    }
    _loaded = true;
    notifyListeners();
  }

  Future<void> _persist() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_learnedKey, _learned.toList());
    await prefs.setString(_boxesKey, jsonEncode(_boxes));
  }

  void markCorrect(String id) {
    _learned.add(id);
    final next = (_boxes[id] ?? 0) + 1;
    _boxes[id] = next > 5 ? 5 : next;
    notifyListeners();
    _persist();
  }

  void markWrong(String id) {
    _learned.remove(id);
    _boxes[id] = 0;
    notifyListeners();
    _persist();
  }

  Future<void> resetProgress() async {
    _learned.clear();
    _boxes.clear();
    notifyListeners();
    await _persist();
  }
}
