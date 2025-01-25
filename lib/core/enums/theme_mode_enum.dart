import 'package:flutter/material.dart';

enum ThemeModeEnum {
  light,
  dark,
  system,
}

extension ThemeModeX on ThemeModeEnum {
  bool get isLight => this == ThemeModeEnum.light;
  bool get isDark => this == ThemeModeEnum.dark;
  bool get isSystem => this == ThemeModeEnum.system;

  ThemeMode get themeMode {
    switch (this) {
      case ThemeModeEnum.light:
        return ThemeMode.light;
      case ThemeModeEnum.dark:
        return ThemeMode.dark;
      case ThemeModeEnum.system:
        return ThemeMode.system;
    }
  }
}
