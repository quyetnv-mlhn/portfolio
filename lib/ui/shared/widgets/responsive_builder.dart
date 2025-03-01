import 'package:flutter/material.dart';
import 'package:portfolio/core/enums/screen_size.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    BoxConstraints constraints,
    ScreenSize screenSize,
  )
  builder;
  final bool useLayoutBuilder;

  const ResponsiveBuilder({
    super.key,
    required this.builder,
    this.useLayoutBuilder = true,
  });

  @override
  Widget build(BuildContext context) {
    if (!useLayoutBuilder) {
      final width = MediaQuery.of(context).size.width;
      return builder(
        context,
        BoxConstraints(maxWidth: width),
        ScreenSize.fromWidth(width),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final screenSize = ScreenSize.fromWidth(constraints.maxWidth);
        return builder(context, constraints, screenSize);
      },
    );
  }
}
