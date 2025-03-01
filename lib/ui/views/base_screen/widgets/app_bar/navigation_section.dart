import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/enums/navigation_section_enum.dart';
import 'package:portfolio/ui/views/base_screen/view_models/navigation_view_model.dart';

class NavigationSectionWidget extends ConsumerWidget {
  final NavigationSection selectedSection;

  const NavigationSectionWidget({super.key, required this.selectedSection});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children:
          NavigationSection.values
              .where((section) => section != NavigationSection.home)
              .map((section) => _buildNavItem(context, section, ref))
              .toList(),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    NavigationSection section,
    WidgetRef ref,
  ) {
    return NavItem(
      title: section.key,
      isActive: section == selectedSection,
      onTap:
          () =>
              ref.read(navigationStateProvider.notifier).selectSection(section),
    );
  }
}

class NavItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.bodyLarge?.copyWith(
      color:
          isActive
              ? theme.colorScheme.primary
              : theme.textTheme.bodyLarge?.color,
      fontWeight: FontWeight.w500,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(title.tr(), style: textStyle),
          ),
        ),
      ),
    );
  }
}
