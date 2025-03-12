import 'package:flutter/material.dart';
import 'package:portfolio/core/configs/app_breakpoints.dart';
import 'package:portfolio/core/enums/screen_type.dart';
import 'package:portfolio/ui/shared/widgets/responsive_container.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  ScreenType _getScreenType(double width) => switch (width) {
    <= AppBreakpoints.mobile => ScreenType.mobile,
    <= AppBreakpoints.tablet => ScreenType.tablet,
    <= AppBreakpoints.desktop => ScreenType.desktop,
    _ => ScreenType.desktopLarge,
  };

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final screenType = _getScreenType(constraints.maxWidth);
          // final isDesktop = screenType.isDesktop;

          return ExperienceContent(screenType: screenType);
        },
      ),
    );
  }
}

class ExperienceContent extends StatelessWidget {
  final ScreenType screenType;

  const ExperienceContent({required this.screenType, super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // TODO: Add your content here
      ],
    );
  }
}
