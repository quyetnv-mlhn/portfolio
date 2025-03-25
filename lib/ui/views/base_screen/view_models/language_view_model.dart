import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/enums/locale_enum.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'language_view_model.g.dart';

@riverpod
class LanguageState extends _$LanguageState {
  static const _languageKey = 'selected_language';

  @override
  LocaleEnum build() {
    _restoreLanguage();
    return LocaleEnum.en;
  }

  Future<void> _restoreLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLanguage = prefs.getString(_languageKey);
    if (savedLanguage != null) {
      state = LocaleEnum.values.firstWhere(
        (e) => e.name == savedLanguage,
        orElse: () => LocaleEnum.en,
      );
    }
  }

  Future<void> toggleLanguage(BuildContext context) async {
    final currentLocale = state;
    final newLocale =
        currentLocale == LocaleEnum.en ? LocaleEnum.vi : LocaleEnum.en;

    await context.setLocale(newLocale.locale);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, newLocale.name);

    state = newLocale;
  }
}
