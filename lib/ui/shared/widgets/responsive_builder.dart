import 'package:flutter/material.dart';
import 'package:portfolio/core/enums/screen_type.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    BoxConstraints constraints,
    ScreenType screenType,
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
        ScreenType.getScreenTypeFromWidth(width),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final screenType = ScreenType.getScreenTypeFromWidth(
          constraints.maxWidth,
        );
        return builder(context, constraints, screenType);
      },
    );
  }
}
