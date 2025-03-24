import 'package:flutter/material.dart';
import 'package:portfolio/core/configs/app_breakpoints.dart';
import 'package:portfolio/core/configs/app_sizes.dart';
import 'package:portfolio/core/enums/screen_type.dart';
import 'package:portfolio/ui/shared/widgets/responsive_container.dart';
import 'package:portfolio/ui/views/about_me/widgets/about_me_content.dart';
import 'package:portfolio/ui/views/about_me/widgets/profile_image_section.dart';

class AboutMeScreen extends StatelessWidget {
  const AboutMeScreen({super.key});

  static const _spacingBetweenSections = spacingXL;

  ScreenType _getScreenType(double width) => switch (width) {
    <= AppBreakpoints.mobile => ScreenType.mobile,
    <= AppBreakpoints.tablet => ScreenType.tablet,
    <= AppBreakpoints.desktop => ScreenType.desktop,
    _ => ScreenType.desktopLarge,
  };

  Widget _buildImageSection(
    ScreenType screenType,
    BoxConstraints constraints,
    bool isDesktop,
  ) => Flexible(
    flex: isDesktop ? 1 : 0,
    child: ProfileImageSection(
      screenType: screenType,
      constraints: constraints,
    ),
  );

  Widget _buildSpacer(bool isDesktop) => SizedBox(
    width: isDesktop ? spacingXXL : 0,
    height: isDesktop ? 0 : _spacingBetweenSections,
  );

  Widget _buildContentSection(ScreenType screenType, bool isDesktop) =>
      Flexible(
        flex: isDesktop ? 1 : 0,
        child: AboutMeContent(screenType: screenType),
      );

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final screenType = _getScreenType(constraints.maxWidth);
          final isDesktop = screenType.isDesktop;

          return Flex(
            direction: isDesktop ? Axis.horizontal : Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildImageSection(screenType, constraints, isDesktop),
              _buildSpacer(isDesktop),
              _buildContentSection(screenType, isDesktop),
            ],
          );
        },
      ),
    );
  }
}
