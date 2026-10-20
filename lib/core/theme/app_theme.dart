import 'package:flutter/material.dart';

abstract final class AppColors {
  static const bg = Color(0xFF10201A);
  static const surface = Color(0xFF1B3228);
  static const surfaceHigh = Color(0xFF244235);
  static const outline = Color(0xFF3A5A4A);
  static const amber = Color(0xFFF5B83D);
  static const cyan = Color(0xFF4FD1C5);
  static const danger = Color(0xFFE5484D);
  static const success = Color(0xFF46C281);
  static const textPrimary = Color(0xFFF2F7F4);
  static const textSecondary = Color(0xFFA9C0B5);
  static const textDisabled = Color(0xFF6C8579);
}

abstract final class AppTheme {
  static ThemeData build() => ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.bg,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.amber,
          secondary: AppColors.cyan,
          surface: AppColors.surface,
          error: AppColors.danger,
          onPrimary: Color(0xFF1B1300),
        ),
        textTheme: const TextTheme().apply(
          bodyColor: AppColors.textPrimary,
          displayColor: AppColors.textPrimary,
        ),
      );
}
