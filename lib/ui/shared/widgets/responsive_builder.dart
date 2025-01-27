import 'package:flutter/material.dart';
import 'package:portfolio/core/configs/app_breakpoints.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    BoxConstraints constraints,
    ScreenType screenType,
  ) builder;

  const ResponsiveBuilder({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenType = _getScreenType(constraints.maxWidth);
        return builder(context, constraints, screenType);
      },
    );
  }

  ScreenType _getScreenType(double width) {
    if (width < AppBreakpoints.mobile) return ScreenType.mobile;
    if (width < AppBreakpoints.tablet) return ScreenType.tablet;
    if (width < AppBreakpoints.desktop) return ScreenType.desktop;
    return ScreenType.desktopLarge;
  }
}

enum ScreenType {
  mobile,
  tablet,
  desktop,
  desktopLarge,
}
