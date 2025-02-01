import 'package:flutter/material.dart';
import 'package:portfolio/core/configs/app_breakpoints.dart';
import 'package:portfolio/core/enums/screen_size.dart';

extension ResponsiveExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  ScreenSize get screenSize {
    final width = MediaQuery.of(this).size.width;
    if (width < AppBreakpoints.mobile) return ScreenSize.mobile;
    if (width < AppBreakpoints.tablet) return ScreenSize.tablet;
    if (width < AppBreakpoints.desktop) return ScreenSize.desktop;
    return ScreenSize.desktopLarge;
  }

  bool get isMobile => screenSize == ScreenSize.mobile;

  bool get isTablet => screenSize == ScreenSize.tablet;

  bool get isDesktop => screenSize == ScreenSize.desktop;

  bool get isDesktopLarge => screenSize == ScreenSize.desktopLarge;
}
