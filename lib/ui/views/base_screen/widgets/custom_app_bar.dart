import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/configs/app_sizes.dart';
import 'package:portfolio/core/configs/app_breakpoints.dart';
import 'package:portfolio/core/enums/navigation_section_enum.dart';
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

    return AppBar(
      backgroundColor: theme.appBarTheme.backgroundColor,
      elevation: theme.appBarTheme.elevation,
      shadowColor: theme.appBarTheme.shadowColor,
      surfaceTintColor: theme.appBarTheme.surfaceTintColor,
      toolbarHeight: 80,
      leadingWidth: 0,
      titleSpacing: 0,
      title: ResponsiveContainer(
        padding: const EdgeInsets.symmetric(
          vertical: spacingS,
          horizontal: spacingXL,
        ),
        child: _buildAppBarContent(screenWidth, selectedSection),
      ),
    );
  }

  Widget _buildAppBarContent(
    double screenWidth,
    NavigationSection selectedSection,
  ) {
    if (screenWidth < AppBreakpoints.mobile) {
      return const _MobileLayout();
    }

    final bool isTablet = screenWidth < AppBreakpoints.tablet;
    return _DesktopLayout(
      selectedSection: selectedSection,
      isCompact: isTablet,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
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

class _MobileLayout extends StatelessWidget {
  const _MobileLayout();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const LogoSection(),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => Scaffold.of(context).openEndDrawer(),
        ),
      ],
    );
  }
}
