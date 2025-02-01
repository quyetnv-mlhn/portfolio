import 'package:portfolio/core/configs/app_breakpoints.dart';

enum ScreenSize {
  mobile,
  tablet,
  desktop,
  desktopLarge;

  static ScreenSize fromWidth(double width) {
    if (width < AppBreakpoints.mobile) return ScreenSize.mobile;
    if (width < AppBreakpoints.tablet) return ScreenSize.tablet;
    if (width < AppBreakpoints.desktop) return ScreenSize.desktop;
    return ScreenSize.desktopLarge;
  }
}
