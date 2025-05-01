import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/configs/app_sizes.dart';
import 'package:portfolio/core/enums/navigation_section_enum.dart';
import 'package:portfolio/core/enums/screen_type.dart';
import 'package:portfolio/core/extensions/responsive_extension.dart';
import 'package:portfolio/ui/shared/widgets/responsive_builder.dart';
import 'package:portfolio/ui/views/base_screen/view_models/navigation_view_model.dart';
import 'package:portfolio/ui/views/base_screen/widgets/custom_app_bar.dart';
import 'package:portfolio/ui/views/base_screen/widgets/drawer/mobile_drawer.dart';
import 'package:portfolio/ui/views/base_screen/widgets/side_info_section.dart';

class BaseScreen extends ConsumerStatefulWidget {
  final Widget child;

  const BaseScreen({required this.child, super.key});

  @override
  ConsumerState<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends ConsumerState<BaseScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedSection = ref.watch(navigationStateProvider);
    final navigationNotifier = ref.read(navigationStateProvider.notifier);

    // Listen to section changes and reset scroll
    ref.listen(navigationStateProvider, (previous, next) {
      navigationNotifier.selectSection(next, context);
      if (previous != next && _scrollController.hasClients) {
        _scrollController.jumpTo(0);
      }
    });

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
                      padding: _getResponsivePadding(screenType),
                      child: widget.child,
                    )
                    : SingleChildScrollView(
                      controller: _scrollController,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height,
                        ),
                        child: Padding(
                          padding: _getResponsivePadding(screenType),
                          child: widget.child,
                        ),
                      ),
                    ),
                if (screenType != ScreenType.mobile) const SideInfoSection(),
              ],
            ),
      ),
    );
  }

  EdgeInsets _getResponsivePadding(ScreenType type) {
    return switch (type) {
      ScreenType.mobile => const EdgeInsets.symmetric(
        horizontal: spacingM,
        vertical: spacingS,
      ),
      ScreenType.tablet =>
        const EdgeInsets.symmetric(horizontal: spacingXL, vertical: spacingM) +
            const EdgeInsets.symmetric(horizontal: 70),
      ScreenType.desktop || ScreenType.desktopLarge =>
        const EdgeInsets.symmetric(horizontal: spacingXXL, vertical: spacingL) +
            const EdgeInsets.symmetric(horizontal: 70),
    };
  }
}
