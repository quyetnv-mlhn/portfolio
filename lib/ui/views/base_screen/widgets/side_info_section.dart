import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/configs/app_sizes.dart';
import 'package:portfolio/core/utils/url_launcher_utils.dart';
import 'package:portfolio/gen/assets.gen.dart';
import 'package:portfolio/gen/locale_keys.g.dart';
import 'package:portfolio/ui/shared/widgets/svg_icon_button.dart';

class SideInfoSection extends StatelessWidget {
  const SideInfoSection({super.key});

  static final _socialLinks = [
    SocialLink(
      icon: Assets.icons.facebook,
      tooltip: LocaleKeys.social_facebook,
      url: 'https://facebook.com/vanquyet.dev',
    ),
    SocialLink(
      icon: Assets.icons.telegram,
      tooltip: LocaleKeys.social_telegram,
      url: 'https://t.me/vanquyet',
    ),
    SocialLink(
      icon: Assets.icons.github,
      tooltip: LocaleKeys.social_github,
      url: 'https://github.com/vanquyet',
    ),
    SocialLink(
      icon: Assets.icons.linkedin,
      tooltip: LocaleKeys.social_linkedin,
      url: 'https://linkedin.com/in/vanquyet',
    ),
  ];

  static const _nameLetters = 'VĂN • QUYẾT';

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(flex: 2),
          _VerticalName(),
          Spacer(flex: 1),
          _SocialLinks(),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}

class _VerticalName extends StatelessWidget {
  const _VerticalName();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.bodyLarge?.copyWith(
      color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
      height: 1,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: SideInfoSection._nameLetters.split('').map((char) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Text(char, style: textStyle),
        );
      }).toList(),
    );
  }
}

class _SocialLinks extends StatelessWidget {
  const _SocialLinks();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: SideInfoSection._socialLinks.map((social) {
        return Padding(
          padding: const EdgeInsets.only(bottom: spacingL),
          child: Tooltip(
            message: social.tooltip.tr(),
            child: SvgIconButton(
              assetPath: social.icon,
              backgroundColor: _getBackgroundColor(social.icon, theme),
              onTap: () => UrlLauncherUtils.launchURL(social.url),
            ),
          ),
        );
      }).toList(),
    );
  }

  Color _getBackgroundColor(String icon, ThemeData theme) {
    return icon == Assets.icons.facebook
        ? theme.colorScheme.primary
        : theme.colorScheme.onSurface.withValues(alpha: 0.5);
  }
}

class SocialLink {
  final String icon;
  final String tooltip;
  final String url;

  const SocialLink({
    required this.icon,
    required this.tooltip,
    required this.url,
  });
}
