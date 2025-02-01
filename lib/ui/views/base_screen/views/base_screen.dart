import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/configs/app_sizes.dart';
import 'package:portfolio/core/enums/navigation_section_enum.dart';
import 'package:portfolio/core/enums/screen_size.dart';
import 'package:portfolio/ui/shared/widgets/responsive_builder.dart';
import 'package:portfolio/ui/views/base_screen/widgets/custom_app_bar.dart';
import 'package:portfolio/ui/views/base_screen/view_models/navigation_view_model.dart';
import 'package:portfolio/ui/views/base_screen/widgets/drawer/mobile_drawer.dart';
import 'package:portfolio/ui/views/base_screen/widgets/side_info_section.dart';
import 'package:portfolio/ui/views/home/view/home_screen.dart';

class BaseScreen extends ConsumerWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSection = ref.watch(navigationStateProvider);
    final screenSize = ScreenSize.fromWidth(MediaQuery.of(context).size.width);

    return Scaffold(
      appBar: const CustomAppBar(),
      endDrawer: screenSize == ScreenSize.mobile ? const MobileDrawer() : null,
      endDrawerEnableOpenDragGesture: false,
      body: ResponsiveBuilder(
        builder: (_, __, screenType) => Row(
          children: [
            if (screenType != ScreenSize.mobile) const SideInfoSection(),
            Expanded(
              child: Padding(
                padding: _getResponsivePadding(screenSize),
                child: _buildContent(selectedSection),
              ),
            ),
          ],
        ),
      ),
    );
  }

  EdgeInsets _getResponsivePadding(ScreenSize size) {
    return switch (size) {
      ScreenSize.mobile => const EdgeInsets.symmetric(
          horizontal: 0,
          vertical: spacingS,
        ),
      ScreenSize.tablet => const EdgeInsets.symmetric(
          horizontal: spacingXL,
          vertical: spacingM,
        ),
      ScreenSize.desktop ||
      ScreenSize.desktopLarge =>
        const EdgeInsets.symmetric(
          horizontal: spacingXXL,
          vertical: spacingL,
        ),
    };
  }

  Widget _buildContent(NavigationSection selectedSection) =>
      switch (selectedSection) {
        NavigationSection.home => const HomeScreen(),
        NavigationSection.aboutMe =>
          const _PlaceholderScreen(title: 'About Me Screen'),
        NavigationSection.myBlogs =>
          const _PlaceholderScreen(title: 'My Blogs Screen'),
        NavigationSection.experiences =>
          const _PlaceholderScreen(title: 'Experiences Screen'),
        NavigationSection.lifetime =>
          const _PlaceholderScreen(title: 'Lifetime Screen'),
        NavigationSection.contact =>
          const _PlaceholderScreen(title: 'Contact Screen'),
      };
}

class _PlaceholderScreen extends StatelessWidget {
  final String title;

  const _PlaceholderScreen({required this.title});

  @override
  Widget build(BuildContext context) => Center(child: Text(title));
}
