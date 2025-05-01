import 'package:portfolio/core/configs/app_breakpoints.dart';

enum ScreenType {
  mobile,
  tablet,
  desktop,
  desktopLarge;

  bool get isMobile => this == ScreenType.mobile;
  bool get isTablet => this == ScreenType.tablet;
  bool get isDesktop =>
      this == ScreenType.desktop || this == ScreenType.desktopLarge;

  static ScreenType getScreenTypeFromWidth(double width) => switch (width) {
    <= AppBreakpoints.mobile => ScreenType.mobile,
    <= AppBreakpoints.tablet => ScreenType.tablet,
    <= AppBreakpoints.desktop => ScreenType.desktop,
    _ => ScreenType.desktopLarge,
  };
}
