import 'package:flutter/material.dart';

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
      constraints: BoxConstraints(maxWidth: maxWidth ?? 1280),
      padding: padding,
      color: backgroundColor,
      child: child,
    );

    return center ? Center(child: content) : content;
  }
}
