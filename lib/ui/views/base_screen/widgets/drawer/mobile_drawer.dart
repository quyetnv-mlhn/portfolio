import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/configs/app_sizes.dart';
import 'package:portfolio/core/enums/navigation_section_enum.dart';
import 'package:portfolio/ui/views/base_screen/view_models/navigation_view_model.dart';
import 'package:portfolio/ui/views/base_screen/widgets/app_bar/action_section.dart';

class MobileDrawer extends ConsumerWidget {
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSection = ref.watch(navigationStateProvider);
    final theme = Theme.of(context);

    return SizedBox(
      width: MediaQuery.of(context).size.width, // Makes the drawer full screen
      child: Drawer(
        child: Column(
          children: [
            /// Close button at the top-right corner
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.close, color: theme.colorScheme.onSurface),
                onPressed: () => Navigator.pop(context),
              ),
            ),

            /// Navigation items centered in the drawer
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children:
                      NavigationSection.values.map((section) {
                        return _DrawerItem(
                          section: section,
                          isSelected: section == selectedSection,
                          onTap: () {
                            ref
                                .read(navigationStateProvider.notifier)
                                .selectSection(section, context);
                            Navigator.pop(context);
                          },
                        );
                      }).toList(),
                ),
              ),
            ),

            /// LanguageSwitcher and ThemeToggle placed at the bottom
            const Padding(
              padding: EdgeInsets.only(bottom: spacingL),
              child: ActionSection(),
            ),
          ],
        ),
      ),
    );
  }
}

/// Represents a single item in the drawer
class _DrawerItem extends StatelessWidget {
  final NavigationSection section;
  final bool isSelected;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.section,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: spacingS),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(spacingS),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: spacingS,
            horizontal: spacingL,
          ),
          child: Text(
            section.key.tr(),
            style: theme.textTheme.titleMedium?.copyWith(
              color:
                  isSelected
                      ? theme.colorScheme.primary
                      : theme.colorScheme.onSurface,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
