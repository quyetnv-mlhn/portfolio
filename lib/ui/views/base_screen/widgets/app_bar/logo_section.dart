import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/core/configs/app_sizes.dart';
import 'package:portfolio/core/enums/navigation_section_enum.dart';
import 'package:portfolio/core/extensions/responsive_extension.dart';
import 'package:portfolio/gen/assets.gen.dart';
import 'package:portfolio/gen/locale_keys.g.dart';
import 'package:portfolio/ui/views/base_screen/view_models/navigation_view_model.dart';
import 'package:portfolio/ui/views/base_screen/view_models/personal_info_view_model.dart';

class LogoSection extends ConsumerWidget {
  const LogoSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final avatarPath = ref.watch(
      personalInfoStateProvider.select((value) => value.value?.imagePath),
    );

    void onTap() => ref
        .read(navigationStateProvider.notifier)
        .selectSection(NavigationSection.home, context);

    return _LogoContent(
      theme: theme,
      avatarPath: avatarPath,
      isMobile: context.isMobile,
      onTap: onTap,
    );
  }
}

class _LogoContent extends StatelessWidget {
  final ThemeData theme;
  final String? avatarPath;
  final bool isMobile;
  final VoidCallback onTap;

  const _LogoContent({
    required this.theme,
    required this.avatarPath,
    required this.isMobile,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _Avatar(theme: theme, isMobile: isMobile, avatarPath: avatarPath),
            const SizedBox(width: 8),
            if (!isMobile) _LogoText(theme: theme),
          ],
        ),
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  final ThemeData theme;
  final bool isMobile;
  final String? avatarPath;

  const _Avatar({
    required this.theme,
    required this.isMobile,
    required this.avatarPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: CircleAvatar(
        radius: isMobile ? 20 : 35,
        backgroundImage: AssetImage(avatarPath ?? Assets.images.avatarPng.path),
      ),
    );
  }
}

class _LogoText extends StatelessWidget {
  final ThemeData theme;

  const _LogoText({required this.theme});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRect(
          child: SvgPicture.asset(
            Assets.icons.arrow,
            colorFilter: ColorFilter.mode(
              theme.colorScheme.onSurface,
              BlendMode.srcIn,
            ),
            alignment: Alignment.center,
            fit: BoxFit.scaleDown,
            width: spacingXXL,
            height: spacingL,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: spacingL),
          child: Text(
            LocaleKeys.name.tr(),
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
