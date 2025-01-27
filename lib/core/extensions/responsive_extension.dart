import 'package:flutter/material.dart';
import 'package:portfolio/core/configs/app_breakpoints.dart';
import 'package:portfolio/ui/shared/widgets/responsive_builder.dart';

extension ResponsiveExtension on BuildContext {
  ScreenType get screenType {
    final width = MediaQuery.of(this).size.width;
    if (width < AppBreakpoints.mobile) return ScreenType.mobile;
    if (width < AppBreakpoints.tablet) return ScreenType.tablet;
    if (width < AppBreakpoints.desktop) return ScreenType.desktop;
    return ScreenType.desktopLarge;
  }

  bool get isMobile => screenType == ScreenType.mobile;
  bool get isTablet => screenType == ScreenType.tablet;
  bool get isDesktop => screenType == ScreenType.desktop;
  bool get isDesktopLarge => screenType == ScreenType.desktopLarge;

  double get contentPadding {
    switch (screenType) {
      case ScreenType.mobile:
        return AppBreakpoints.contentPaddingMobile;
      case ScreenType.tablet:
        return AppBreakpoints.contentPaddingTablet;
      case ScreenType.desktop:
      case ScreenType.desktopLarge:
        return AppBreakpoints.contentPaddingDesktop;
    }
  }
}
