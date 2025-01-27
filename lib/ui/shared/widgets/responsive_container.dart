import 'package:flutter/material.dart';
import 'package:portfolio/core/configs/app_breakpoints.dart';

class ResponsiveContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;

  const ResponsiveContainer({
    super.key,
    required this.child,
    this.padding,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: AppBreakpoints.maxWidthDesktopLarge,
        ),
        padding: padding,
        color: backgroundColor,
        child: child,
      ),
    );
  }
}
