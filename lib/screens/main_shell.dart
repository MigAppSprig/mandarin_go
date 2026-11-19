import 'package:flutter/material.dart';

import 'dialogues_screen.dart';
import 'flashcards_screen.dart';
import 'home_screen.dart';
import 'pinyin_screen.dart';
import 'translator_screen.dart';

/// Root scaffold with the bottom navigation bar.
class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _index = 0;

  void _select(int index) => setState(() => _index = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: [
          HomeScreen(onNavigate: _select),
          const PinyinScreen(),
          const FlashcardsScreen(),
          const DialoguesScreen(),
          const TranslatorScreen(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: _select,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.spellcheck),
            label: 'Pinyin',
          ),
          NavigationDestination(
            icon: Icon(Icons.style_outlined),
            selectedIcon: Icon(Icons.style),
            label: 'Cards',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat_bubble_outline),
            selectedIcon: Icon(Icons.chat_bubble),
            label: 'Talk',
          ),
          NavigationDestination(
            icon: Icon(Icons.translate),
            label: 'Translate',
          ),
        ],
      ),
    );
  }
}
