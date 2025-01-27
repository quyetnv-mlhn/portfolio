import 'package:flutter/material.dart';
import 'package:portfolio/core/enums/theme_mode_enum.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_mode_view_model.g.dart';

@riverpod
class ThemeModeState extends _$ThemeModeState {
  @override
  ThemeModeEnum build() {
    return ThemeModeEnum.system;
  }

  void toggleTheme(BuildContext context) {
    final newTheme = switch (state) {
      ThemeModeEnum.system => _getSystemBasedTheme(context),
      ThemeModeEnum.light => ThemeModeEnum.dark,
      ThemeModeEnum.dark => ThemeModeEnum.light,
    };

    state = newTheme;
  }

  ThemeModeEnum _getSystemBasedTheme(BuildContext context) {
    final platformBrightness = MediaQuery.platformBrightnessOf(context);
    return platformBrightness == Brightness.dark
        ? ThemeModeEnum.light
        : ThemeModeEnum.dark;
  }
}
