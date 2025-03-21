// File: lib/core/configs/app_themes.dart
import 'package:flutter/material.dart';
import 'package:portfolio/core/configs/app_colors.dart';
import 'package:portfolio/gen/fonts.gen.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.surfaceLight,
    fontFamily: FontFamily.mali,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryLight,
      surface: AppColors.surfaceLight,
      onSurface: AppColors.textLight,
      secondary: AppColors.accent,
      error: AppColors.error,
      primaryContainer: AppColors.primaryContainerLight,
      onPrimaryContainer: Colors.white,
    ),
    textTheme: const TextTheme(
      // Large Display Styles
      displayLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w800,
        color: AppColors.textLight,
        fontFamily: FontFamily.mali,
      ),
      displayMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: AppColors.textLight,
        fontFamily: FontFamily.mali,
      ),
      displaySmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.textLight,
        fontFamily: FontFamily.mali,
      ),

      // Headline Styles
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: AppColors.textLight,
        letterSpacing: -0.5,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: AppColors.textLight,
        letterSpacing: -0.5,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColors.textLight,
      ),

      // Title Styles
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: AppColors.textLight,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColors.textLight,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.textLight,
      ),

      // Body Styles
      bodyLarge: TextStyle(
        fontSize: 16,
        color: AppColors.textLight,
        height: 1.6,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: AppColors.textLight,
        height: 1.5,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        color: AppColors.textLight,
        height: 1.4,
        fontWeight: FontWeight.w400,
      ),

      // Label Styles
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.textLight,
        letterSpacing: 0.5,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.textLight,
        letterSpacing: 0.5,
      ),
      labelSmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: AppColors.textLight,
        letterSpacing: 0.5,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surfaceLight,
      surfaceTintColor: Colors.transparent,
      elevation: 1,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.textLight,
        fontFamily: FontFamily.mali,
      ),
    ),
    cardTheme: CardTheme(
      color: AppColors.surfaceLight,
      elevation: 2,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.dividerLight,
      thickness: 1,
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.surfaceDark,
    fontFamily: FontFamily.mali,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryDark,
      surface: AppColors.surfaceDark,
      onSurface: AppColors.textDark,
      secondary: AppColors.accent,
      error: AppColors.error,
      primaryContainer: AppColors.primaryContainerDark,
      onPrimaryContainer: Colors.white,
    ),
    textTheme: const TextTheme(
      // Large Display Styles
      displayLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w800,
        color: AppColors.textDark,
        fontFamily: FontFamily.mali,
      ),
      displayMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: AppColors.textDark,
        fontFamily: FontFamily.mali,
      ),
      displaySmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.textDark,
        fontFamily: FontFamily.mali,
      ),

      // Headline Styles
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: AppColors.textDark,
        letterSpacing: -0.5,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: AppColors.textDark,
        letterSpacing: -0.5,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColors.textDark,
      ),

      // Title Styles
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: AppColors.textDark,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColors.textDark,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.textDark,
      ),

      // Body Styles
      bodyLarge: TextStyle(
        fontSize: 16,
        color: AppColors.textDark,
        height: 1.6,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: AppColors.textDark,
        height: 1.5,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        color: AppColors.textDark,
        height: 1.4,
        fontWeight: FontWeight.w400,
      ),

      // Label Styles
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.textDark,
        letterSpacing: 0.5,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.textDark,
        letterSpacing: 0.5,
      ),
      labelSmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: AppColors.textDark,
        letterSpacing: 0.5,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surfaceDark,
      surfaceTintColor: Colors.transparent,
      elevation: 1,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.textDark,
        fontFamily: FontFamily.mali,
      ),
    ),
    cardTheme: CardTheme(
      color: AppColors.surfaceDark,
      elevation: 2,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.dividerDark,
      thickness: 1,
    ),
  );
}
