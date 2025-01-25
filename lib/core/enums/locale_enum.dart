import 'package:flutter/material.dart';

enum LocaleEnum { en, vi }

extension LocaleEnumX on LocaleEnum {
  /// Get the short string representation of the locale
  String get code {
    switch (this) {
      case LocaleEnum.en:
        return 'en';
      case LocaleEnum.vi:
        return 'vi';
    }
  }

  /// Get the display name for the locale
  String get displayName {
    switch (this) {
      case LocaleEnum.en:
        return 'English';
      case LocaleEnum.vi:
        return 'Vietnamese';
    }
  }

  /// Convert LocaleEnum to Flutter's Locale
  Locale get locale {
    switch (this) {
      case LocaleEnum.en:
        return const Locale('en', 'US');
      case LocaleEnum.vi:
        return const Locale('vi', 'VN');
    }
  }

  /// Parse from string to LocaleEnum
  static LocaleEnum fromString(String code) {
    switch (code) {
      case 'en':
        return LocaleEnum.en;
      case 'vi':
        return LocaleEnum.vi;
      default:
        throw ArgumentError('Unsupported locale code: $code');
    }
  }
}
