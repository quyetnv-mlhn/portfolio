import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/configs/app_sizes.dart';
import 'package:portfolio/core/enums/navigation_section_enum.dart';
import 'package:portfolio/core/enums/screen_type.dart';
import 'package:portfolio/core/extensions/responsive_extension.dart';
import 'package:portfolio/ui/shared/widgets/responsive_container.dart';
import 'package:portfolio/ui/views/base_screen/view_models/navigation_view_model.dart';
import 'package:portfolio/ui/views/base_screen/widgets/app_bar/action_section.dart';
import 'package:portfolio/ui/views/base_screen/widgets/app_bar/logo_section.dart';
import 'package:portfolio/ui/views/base_screen/widgets/app_bar/navigation_section.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSection = ref.watch(navigationStateProvider);
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenType = ScreenType.getScreenTypeFromWidth(screenWidth);

    return AppBar(
      backgroundColor: theme.appBarTheme.backgroundColor,
      automaticallyImplyLeading: false,
      elevation: theme.appBarTheme.elevation,
      shadowColor: theme.appBarTheme.shadowColor,
      surfaceTintColor: theme.appBarTheme.surfaceTintColor,
      toolbarHeight: kToolbarHeight + 16,
      leadingWidth: 0,
      titleSpacing: 0,
      actions: _buildActions(context, screenType),
      title: ResponsiveContainer(
        padding: _getResponsivePadding(screenType),
        child: _buildAppBarContent(context, selectedSection),
      ),
    );
  }

  List<Widget>? _buildActions(BuildContext context, ScreenType screenType) {
    if (screenType != ScreenType.mobile) return null;

    return [
      IconButton(
        padding: _getResponsivePadding(screenType),
        icon: const Icon(Icons.menu),
        onPressed: () => Scaffold.of(context).openEndDrawer(),
      ),
    ];
  }

  Widget _buildAppBarContent(
    BuildContext context,
    NavigationSection selectedSection,
  ) {
    if (context.isMobile || context.isTablet) {
      return const Row(children: [LogoSection()]);
    }

    return _DesktopLayout(selectedSection: selectedSection);
  }

  EdgeInsets _getResponsivePadding(ScreenType type) {
    return switch (type) {
      ScreenType.mobile => const EdgeInsets.symmetric(
        vertical: spacingXS,
        horizontal: spacingM,
      ),
      ScreenType.tablet => const EdgeInsets.symmetric(
        vertical: spacingS,
        horizontal: spacingL,
      ),
      ScreenType.desktop || ScreenType.desktopLarge =>
        const EdgeInsets.symmetric(vertical: spacingS, horizontal: spacingXL),
    };
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 16); // 80
}

class _DesktopLayout extends StatelessWidget {
  final NavigationSection selectedSection;

  const _DesktopLayout({required this.selectedSection});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          const LogoSection(),
          Expanded(
            child: FittedBox(
              alignment: Alignment.centerRight,
              fit: BoxFit.scaleDown,
              child: NavigationSectionWidget(selectedSection: selectedSection),
            ),
          ),
          const SizedBox(width: 16),
          const ActionSection(),
        ],
      ),
    );
  }
}
