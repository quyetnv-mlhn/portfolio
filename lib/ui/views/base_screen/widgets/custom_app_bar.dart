import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/configs/app_sizes.dart';
import 'package:portfolio/core/configs/app_breakpoints.dart';
import 'package:portfolio/core/enums/navigation_section_enum.dart';
import 'package:portfolio/core/enums/screen_size.dart';
import 'package:portfolio/ui/views/base_screen/view_models/navigation_view_model.dart';
import 'package:portfolio/ui/views/base_screen/widgets/app_bar/action_section.dart';
import 'package:portfolio/ui/views/base_screen/widgets/app_bar/logo_section.dart';
import 'package:portfolio/ui/views/base_screen/widgets/app_bar/navigation_section.dart';
import 'package:portfolio/ui/shared/widgets/responsive_container.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSection = ref.watch(navigationStateProvider);
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenSize = ScreenSize.fromWidth(screenWidth);

    return AppBar(
      backgroundColor: theme.appBarTheme.backgroundColor,
      elevation: theme.appBarTheme.elevation,
      shadowColor: theme.appBarTheme.shadowColor,
      surfaceTintColor: theme.appBarTheme.surfaceTintColor,
      toolbarHeight: kToolbarHeight + 16, // 80
      leadingWidth: 0,
      titleSpacing: 0,
      actions: _buildActions(context, screenSize),
      title: ResponsiveContainer(
        padding: _getResponsivePadding(screenSize),
        child: _buildAppBarContent(screenWidth, selectedSection),
      ),
    );
  }

  List<Widget>? _buildActions(BuildContext context, ScreenSize screenSize) {
    if (screenSize != ScreenSize.mobile) return null;

    return [
      IconButton(
        padding: _getResponsivePadding(screenSize),
        icon: const Icon(Icons.menu),
        onPressed: () => Scaffold.of(context).openEndDrawer(),
      ),
    ];
  }

  Widget _buildAppBarContent(
    double screenWidth,
    NavigationSection selectedSection,
  ) {
    if (screenWidth < AppBreakpoints.mobile) {
      return const Row(children: [LogoSection()]);
    }

    return _DesktopLayout(
      selectedSection: selectedSection,
      isCompact: ScreenSize.fromWidth(screenWidth) == ScreenSize.tablet,
    );
  }

  EdgeInsets _getResponsivePadding(ScreenSize size) {
    return switch (size) {
      ScreenSize.mobile => const EdgeInsets.symmetric(
          vertical: spacingXS,
          horizontal: spacingM,
        ),
      ScreenSize.tablet => const EdgeInsets.symmetric(
          vertical: spacingS,
          horizontal: spacingL,
        ),
      ScreenSize.desktop ||
      ScreenSize.desktopLarge =>
        const EdgeInsets.symmetric(
          vertical: spacingS,
          horizontal: spacingXL,
        ),
    };
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 16); // 80
}

class _DesktopLayout extends StatelessWidget {
  final NavigationSection selectedSection;
  final bool isCompact;

  const _DesktopLayout({
    required this.selectedSection,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          const LogoSection(),
          const Spacer(),
          NavigationSectionWidget(
            selectedSection: selectedSection,
            showText: !isCompact,
          ),
          const SizedBox(width: 16),
          ActionSection(isCompact: isCompact),
        ],
      ),
    );
  }
}
