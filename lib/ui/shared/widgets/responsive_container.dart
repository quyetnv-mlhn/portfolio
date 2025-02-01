import 'package:flutter/material.dart';
import 'package:portfolio/core/configs/app_breakpoints.dart';

class ResponsiveContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final double? maxWidth;
  final bool center;

  const ResponsiveContainer({
    super.key,
    required this.child,
    this.padding,
    this.backgroundColor,
    this.maxWidth,
    this.center = true,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = Container(
      constraints: BoxConstraints(
        maxWidth: maxWidth ?? AppBreakpoints.maxWidthDesktopLarge,
      ),
      padding: padding,
      color: backgroundColor,
      child: child,
    );

    return center ? Center(child: content) : content;
  }
}
