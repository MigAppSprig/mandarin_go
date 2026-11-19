import 'package:flutter/material.dart';

import '../services/online_translator.dart';
import '../services/translator.dart';
import '../theme/app_theme.dart';
import '../widgets/speak_button.dart';
import '../widgets/tone_colored_pinyin.dart';

class TranslatorScreen extends StatefulWidget {
  const TranslatorScreen({super.key});

  @override
  State<TranslatorScreen> createState() => _TranslatorScreenState();
}

class _TranslatorScreenState extends State<TranslatorScreen> {
  final TextEditingController _controller = TextEditingController();
  List<TranslationResult> _results = const <TranslationResult>[];
  OnlineTranslation? _online;
  bool _onlineLoading = false;
  bool _onlineFailed = false;
  bool _searched = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _translate(String raw) async {
    final query = raw.trim();
    if (query.isEmpty) return;

    // Show offline dictionary matches immediately.
    final offline = Translator.translate(query);
    final exact = Translator.hasExactMatch(query);
    setState(() {
      _results = offline;
      _online = null;
      _onlineLoading = !exact;
      _onlineFailed = false;
      _searched = true;
    });

    // When the offline dictionary already has an exact, curated answer (with
    // an example), prefer it — no network call needed.
    if (exact) return;

    // Otherwise enrich with a full online translation for anything the
    // dictionary doesn't cover.
    final online = await OnlineTranslator.translate(query);
    if (!mounted) return;
    setState(() {
      _online = online;
      _onlineLoading = false;
      _onlineFailed = online == null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Translate')),
      body: Column(
        children: [
          _buildSearchBar(),
          Expanded(child: _buildResults()),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _controller,
            textInputAction: TextInputAction.search,
            onSubmitted: _translate,
            decoration: InputDecoration(
              hintText: 'Type an English word or phrase…',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () => _translate(_controller.text),
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final s in Translator.suggestions)
                ActionChip(
                  label: Text(s),
                  onPressed: () {
                    _controller.text = s;
                    _translate(s);
                  },
                  visualDensity: VisualDensity.compact,
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildResults() {
    if (!_searched) return _buildEmptyState(isSearch: false);

    final children = <Widget>[];

    if (_onlineLoading) {
      children.add(_buildLoadingRow());
    }

    if (_online != null) {
      children.add(_buildOnlineCard(_online!));
      if (_results.isNotEmpty) {
        children.add(_sectionHeader('Dictionary matches (with examples)'));
      }
    } else if (_onlineFailed) {
      if (_results.isEmpty) {
        children.add(_buildEmptyState(isSearch: true));
      } else {
        children.add(_buildOfflineOnlyNote());
      }
    } else if (_results.isEmpty) {
      children.add(_buildEmptyState(isSearch: true));
    }

    for (final r in _results) {
      children.add(_buildResult(r));
    }

    return ListView(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 24),
      children: children,
    );
  }

  Widget _buildLoadingRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          const SizedBox(
            width: 18,
            height: 18,
            child: CircularProgressIndicator(strokeWidth: 2.5),
          ),
          const SizedBox(width: 12),
          Text(
            'Translating online…',
            style: TextStyle(fontSize: 14, color: AppColors.muted),
          ),
        ],
      ),
    );
  }

  Widget _buildOfflineOnlyNote() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 4),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.gold.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(Icons.wifi_off, size: 18, color: AppColors.gold),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'Online translation unavailable — showing offline dictionary only. '
                'Check your connection.',
                style: TextStyle(fontSize: 13, color: AppColors.muted),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 4),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.4,
          color: AppColors.muted,
        ),
      ),
    );
  }

  Widget _buildOnlineCard(OnlineTranslation r) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.cloud_done, size: 16, color: AppColors.jade),
                const SizedBox(width: 6),
                Text(
                  'ONLINE TRANSLATION',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1,
                    color: AppColors.jade,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Text(
                    r.hanzi,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: AppColors.ink,
                    ),
                  ),
                ),
                SpeakButton(text: r.hanzi, size: 48),
              ],
            ),
            if (r.pinyin.isNotEmpty) ...[
              const SizedBox(height: 8),
              ToneColoredPinyin(
                pinyin: r.pinyin,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ],
            if (r.source.isNotEmpty) ...[
              const SizedBox(height: 6),
              Text(
                r.source,
                style: TextStyle(fontSize: 14, color: AppColors.muted),
              ),
            ],
            const SizedBox(height: 10),
            Text(
              'Machine translation — may be imperfect.',
              style: TextStyle(
                fontSize: 11,
                color: AppColors.muted.withValues(alpha: 0.75),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState({required bool isSearch}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.translate, size: 64, color: AppColors.gold),
            const SizedBox(height: 16),
            Text(
              isSearch ? 'No match found.' : 'English → Chinese',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text(
              isSearch
                  ? 'Try a simpler word or a different phrase.'
                  : 'Type an English word or phrase to see the Chinese characters, '
                      'pinyin, pronunciation and an example sentence. '
                      'Full sentences are translated online.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, height: 1.5, color: AppColors.muted),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResult(TranslationResult r) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    r.hanzi,
                    style: const TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w800,
                      color: AppColors.ink,
                    ),
                  ),
                ),
                SpeakButton(text: r.hanzi, size: 48),
              ],
            ),
            const SizedBox(height: 6),
            ToneColoredPinyin(
              pinyin: r.pinyin,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Expanded(
                  child: Text(
                    r.english,
                    style: TextStyle(fontSize: 15, color: AppColors.muted),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.red.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    r.category,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: AppColors.red,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.paper,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.format_quote, size: 18, color: AppColors.gold),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          r.exampleHanzi,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.ink,
                          ),
                        ),
                      ),
                      SpeakButton(text: r.exampleHanzi, size: 34),
                    ],
                  ),
                  const SizedBox(height: 6),
                  ToneColoredPinyin(pinyin: r.examplePinyin, fontSize: 13),
                  const SizedBox(height: 4),
                  Text(
                    r.exampleEnglish,
                    style: TextStyle(fontSize: 13, color: AppColors.muted),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
