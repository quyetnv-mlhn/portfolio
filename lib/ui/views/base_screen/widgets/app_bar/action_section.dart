import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/enums/locale_enum.dart';
import 'package:portfolio/core/enums/theme_mode_enum.dart';
import 'package:portfolio/gen/assets.gen.dart';
import 'package:portfolio/ui/shared/widgets/svg_icon_button.dart';
import 'package:portfolio/ui/views/base_screen/view_models/language_view_model.dart';
import 'package:portfolio/ui/views/base_screen/view_models/theme_mode_view_model.dart';

class ActionSection extends ConsumerWidget {
  final bool isCompact;

  const ActionSection({
    super.key,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final currentLocale = ref.watch(languageStateProvider);
    final themeModeState = ref.watch(themeModeStateProvider);

    // Handle theme mode dynamically
    final currentThemeMode = themeModeState == ThemeModeEnum.system
        ? (MediaQuery.platformBrightnessOf(context) == Brightness.dark
            ? ThemeModeEnum.dark
            : ThemeModeEnum.light)
        : themeModeState;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!isCompact) ...[
          _buildLanguageButton(
            label: 'VI',
            isActive: currentLocale == LocaleEnum.vi,
            onPressed: () {
              if (currentLocale != LocaleEnum.vi) {
                ref
                    .read(languageStateProvider.notifier)
                    .toggleLanguage(context);
              }
            },
            theme: theme,
          ),
          const Text('|'),
          _buildLanguageButton(
            label: 'EN',
            isActive: currentLocale == LocaleEnum.en,
            onPressed: () {
              if (currentLocale != LocaleEnum.en) {
                ref
                    .read(languageStateProvider.notifier)
                    .toggleLanguage(context);
              }
            },
            theme: theme,
          ),
          const SizedBox(width: 16),
        ],
        _ThemeToggle(
          isDarkTheme: currentThemeMode == ThemeModeEnum.dark,
          onPressed: () {
            ref.read(themeModeStateProvider.notifier).toggleTheme(context);
          },
        ),
      ],
    );
  }

  Widget _buildLanguageButton({
    required String label,
    required bool isActive,
    required VoidCallback onPressed,
    required ThemeData theme,
  }) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 8),
        ),
      ),
      child: Text(
        label,
        style: theme.textTheme.bodyLarge?.copyWith(
          color: isActive
              ? theme.colorScheme.primary
              : theme.textTheme.bodyLarge?.color,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _ThemeToggle extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isDarkTheme;

  const _ThemeToggle({
    required this.onPressed,
    required this.isDarkTheme,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SvgIconButton(
      assetPath:
          isDarkTheme ? Assets.icons.houseNight : Assets.icons.brightness,
      color: theme.colorScheme.onSurface,
      onTap: onPressed,
    );
  }
}
