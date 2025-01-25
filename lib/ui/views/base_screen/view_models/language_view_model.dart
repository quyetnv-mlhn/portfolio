import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:portfolio/core/enums/locale_enum.dart';

part 'language_view_model.g.dart';

@riverpod
class LanguageState extends _$LanguageState {
  @override
  LocaleEnum build() {
    return LocaleEnum.en;
  }

  Future<void> toggleLanguage(BuildContext context) async {
    final currentLocale = state;
    final newLocale =
        currentLocale == LocaleEnum.en ? LocaleEnum.vi : LocaleEnum.en;

    await context.setLocale(newLocale.locale);
    state = newLocale;
  }
}
