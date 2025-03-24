import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/configs/app_sizes.dart';
import 'package:portfolio/core/utils/url_launcher_utils.dart';
import 'package:portfolio/domain/models/personal_info.dart';
import 'package:portfolio/gen/assets.gen.dart';
import 'package:portfolio/gen/locale_keys.g.dart';
import 'package:portfolio/ui/shared/widgets/svg_icon_button.dart';
import 'package:portfolio/ui/views/base_screen/view_models/personal_info_view_model.dart';

class SideInfoSection extends ConsumerWidget {
  const SideInfoSection({super.key});

  static const _sidebarWidth = 70.0;

  static final Map<String, String> _platformIcons = {
    'facebook': Assets.icons.facebook,
    'telegram': Assets.icons.telegram,
    'github': Assets.icons.github,
    'linkedin': Assets.icons.linkedin,
  };

  static const Map<String, String> _platformTooltips = {
    'facebook': LocaleKeys.social_facebook,
    'telegram': LocaleKeys.social_telegram,
    'github': LocaleKeys.social_github,
    'linkedin': LocaleKeys.social_linkedin,
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref
        .watch(personalInfoStateProvider)
        .when(
          loading: () => _buildLoadingState(),
          error: (error, stackTrace) => _buildErrorState(),
          data: (data) => _buildContent(data),
        );
  }

  Widget _buildLoadingState() => const SizedBox();

  Widget _buildErrorState() => const SizedBox();

  Widget _buildContent(PersonalInfo data) {
    return SizedBox(
      width: _sidebarWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(flex: 2),
          _VerticalName(name: data.name),
          const Spacer(flex: 1),
          _SocialLinks(socialLinks: _mapSocialLinks(data.socialLinks)),
          const Spacer(flex: 2),
        ],
      ),
    );
  }

  List<SocialLink> _mapSocialLinks(List<SocialLinkInfo> links) {
    return links
        .map(
          (social) => SocialLink(
            icon: _platformIcons[social.platform] ?? '',
            tooltip: _platformTooltips[social.platform] ?? '',
            url: social.url,
          ),
        )
        .toList();
  }
}

class _VerticalName extends StatelessWidget {
  final String name;
  static const double _letterSpacing = 6.0;

  const _VerticalName({required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children:
          name.split('').map((char) => _buildLetter(context, char)).toList(),
    );
  }

  Widget _buildLetter(BuildContext context, String char) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.bodyLarge?.copyWith(
      color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
      height: 1,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: _letterSpacing),
      child: Text(char, style: textStyle),
    );
  }
}

class _SocialLinks extends StatelessWidget {
  final List<SocialLink> socialLinks;

  const _SocialLinks({required this.socialLinks});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children:
          socialLinks
              .map((social) => _buildSocialButton(context, social))
              .toList(),
    );
  }

  Widget _buildSocialButton(BuildContext context, SocialLink social) {
    final theme = Theme.of(context);
    final backgroundColor = _getBackgroundColor(social.icon, theme);

    return Padding(
      padding: const EdgeInsets.only(bottom: spacingL),
      child: Tooltip(
        message: social.tooltip.tr(),
        child: SvgIconButton(
          assetPath: social.icon,
          backgroundColor: backgroundColor,
          onTap: () => UrlLauncherUtils.launchURL(social.url),
        ),
      ),
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
