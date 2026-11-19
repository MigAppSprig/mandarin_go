import 'package:flutter/material.dart';

/// Chinese-inspired colour palette (vermilion red + gold on warm paper).
class AppColors {
  AppColors._();

  static const Color red = Color(0xFFC62828);
  static const Color deepRed = Color(0xFF8E1F1F);
  static const Color gold = Color(0xFFF2A71B);
  static const Color jade = Color(0xFF2E7D6B);
  static const Color ink = Color(0xFF24303C);
  static const Color paper = Color(0xFFFBF6EE);
  static const Color paperDark = Color(0xFFF3EAD8);
  static const Color muted = Color(0xFF7A6F5D);

  /// Tone colours used in the pinyin section.
  static const Map<int, Color> toneColors = {
    1: Color(0xFFE53935), // first tone — red
    2: Color(0xFFF57C00), // second tone — orange
    3: Color(0xFF2E7D32), // third tone — green
    4: Color(0xFF1565C0), // fourth tone — blue
    0: Color(0xFF757575), // neutral tone — grey
  };
}

class AppTheme {
  AppTheme._();

  static ThemeData light() {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.red).copyWith(
        primary: AppColors.red,
        secondary: AppColors.gold,
        surface: AppColors.paper,
      ),
      scaffoldBackgroundColor: AppColors.paper,
    );

    return base.copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.red,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 1.5,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Colors.white,
        indicatorColor: AppColors.red.withValues(alpha: 0.14),
        labelTextStyle: WidgetStatePropertyAll(
          TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.red,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      chipTheme: base.chipTheme.copyWith(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
