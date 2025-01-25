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
    final currentLocale = ref.watch(languageStateProvider);
    final currentTheme = ref.watch(themeModeStateProvider);
    final isDarkMode = currentTheme.isDark;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!isCompact) ...[
          ...LocaleEnum.values.map((locale) => _LanguageButton(
                label: locale.code.toUpperCase(),
                isActive: currentLocale == locale,
                onPressed: () => ref
                    .read(languageStateProvider.notifier)
                    .toggleLanguage(context),
              )),
          const SizedBox(width: 12),
        ],
        _ThemeToggle(
          isDarkMode: isDarkMode,
          onPressed: () =>
              ref.read(themeModeStateProvider.notifier).toggleTheme(context),
        ),
      ],
    );
  }
}

class _LanguageButton extends ConsumerWidget {
  final String label;
  final bool isActive;
  final VoidCallback onPressed;

  const _LanguageButton({
    required this.label,
    required this.onPressed,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isHovered = ref.watch(_hoverProvider);

    return MouseRegion(
      onEnter: (_) => ref.read(_hoverProvider.notifier).state = true,
      onExit: (_) => ref.read(_hoverProvider.notifier).state = false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            ),
            overlayColor: WidgetStateProperty.resolveWith<Color?>(
              (states) => states.contains(WidgetState.pressed)
                  ? theme.colorScheme.primary.withValues(alpha: 0.1)
                  : null,
            ),
            foregroundColor: WidgetStateProperty.resolveWith<Color>(
              (states) {
                if (isActive) return theme.colorScheme.primary;
                if (isHovered) {
                  return theme.colorScheme.primary.withValues(alpha: 0.8);
                }
                return theme.textTheme.bodyLarge?.color ??
                    theme.colorScheme.onSurface;
              },
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: Text(
              label,
              key: ValueKey('$label${isActive ? '-active' : ''}'),
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ThemeToggle extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onPressed;

  const _ThemeToggle({
    required this.isDarkMode,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: isDarkMode ? 'Switch to Light Mode' : 'Switch to Dark Mode',
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: SvgIconButton(
          key: ValueKey(isDarkMode),
          assetPath:
              isDarkMode ? Assets.icons.houseNight : Assets.icons.brightness,
          size: 24,
          color: Theme.of(context).colorScheme.onSurface,
          hoverColor: Theme.of(context).hoverColor,
          onTap: onPressed,
        ),
      ),
    );
  }
}

// Providers
final _hoverProvider = StateProvider<bool>((ref) => false);
