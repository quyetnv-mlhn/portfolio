import 'package:flutter/material.dart';
import 'package:portfolio/core/enums/screen_type.dart';

extension ResponsiveExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  ScreenType get screenType {
    final width = MediaQuery.of(this).size.width;
    return ScreenType.getScreenTypeFromWidth(width);
  }

  bool get isMobile => screenType.isMobile;

  bool get isTablet => screenType.isTablet;

  bool get isDesktop => screenType.isDesktop;

  bool get isDesktopLarge => screenType == ScreenType.desktopLarge;
}
