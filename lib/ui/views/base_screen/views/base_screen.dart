import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/configs/app_sizes.dart';
import 'package:portfolio/core/enums/navigation_section_enum.dart';
import 'package:portfolio/core/enums/screen_size.dart';
import 'package:portfolio/core/extensions/responsive_extension.dart';
import 'package:portfolio/ui/shared/widgets/responsive_builder.dart';
import 'package:portfolio/ui/views/base_screen/view_models/navigation_view_model.dart';
import 'package:portfolio/ui/views/base_screen/widgets/custom_app_bar.dart';
import 'package:portfolio/ui/views/base_screen/widgets/drawer/mobile_drawer.dart';
import 'package:portfolio/ui/views/base_screen/widgets/side_info_section.dart';

class BaseScreen extends ConsumerWidget {
  final Widget child;

  const BaseScreen({required this.child, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSection = ref.watch(navigationStateProvider);
    final screenSize = ScreenSize.fromWidth(MediaQuery.of(context).size.width);

    return Scaffold(
      appBar: const CustomAppBar(),
      endDrawer:
          context.isMobile || context.isTablet ? const MobileDrawer() : null,
      endDrawerEnableOpenDragGesture: false,
      body: ResponsiveBuilder(
        builder:
            (_, __, screenType) => Stack(
              children: [
                selectedSection == NavigationSection.home
                    ? Padding(
                      padding: _getResponsivePadding(screenSize),
                      child: child,
                    )
                    : SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height,
                        ),
                        child: Padding(
                          padding: _getResponsivePadding(screenSize),
                          child: child,
                        ),
                      ),
                    ),
                if (screenType != ScreenSize.mobile) const SideInfoSection(),
              ],
            ),
      ),
    );
  }

  EdgeInsets _getResponsivePadding(ScreenSize size) {
    return switch (size) {
      ScreenSize.mobile => const EdgeInsets.symmetric(
        horizontal: spacingM,
        vertical: spacingS,
      ),
      ScreenSize.tablet =>
        const EdgeInsets.symmetric(horizontal: spacingXL, vertical: spacingM) +
            const EdgeInsets.symmetric(horizontal: 70),
      ScreenSize.desktop || ScreenSize.desktopLarge =>
        const EdgeInsets.symmetric(horizontal: spacingXXL, vertical: spacingL) +
            const EdgeInsets.symmetric(horizontal: 70),
    };
  }
}
