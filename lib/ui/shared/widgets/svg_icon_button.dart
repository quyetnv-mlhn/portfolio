import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIconButton extends StatelessWidget {
  final String assetPath;
  final double? size;
  final Color? color;
  final Color? hoverColor;
  final Color? splashColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderRadius;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final String? semanticLabel;
  final BoxFit fit;
  final AlignmentGeometry alignment;

  const SvgIconButton({
    super.key,
    required this.assetPath,
    this.size = 24,
    this.color,
    this.hoverColor,
    this.splashColor,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius = 10,
    this.onTap,
    this.padding = const EdgeInsets.all(10),
    this.semanticLabel,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color:
              borderColor ?? theme.colorScheme.onSurface.withValues(alpha: 0.9),
        ),
        color: backgroundColor ?? theme.colorScheme.surface,
      ),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          hoverColor: hoverColor ?? theme.hoverColor.withValues(alpha: 0.1),
          splashColor: splashColor ?? theme.splashColor.withValues(alpha: 0.1),
          onTap: onTap,
          child: Padding(
            padding: padding,
            child: SvgPicture.asset(
              assetPath,
              width: size,
              height: size,
              colorFilter:
                  color != null
                      ? ColorFilter.mode(color!, BlendMode.srcIn)
                      : null,
              semanticsLabel: semanticLabel,
              fit: fit,
              alignment: alignment,
              placeholderBuilder:
                  (context) => SizedBox(
                    width: size,
                    height: size,
                    child: const CircularProgressIndicator(strokeWidth: 2),
                  ),
            ),
          ),
        ),
      ),
    );
  }

  // Network version with container
  factory SvgIconButton.network({
    Key? key,
    required String url,
    required String fallbackAssetPath,
    double size = 24,
    Color? color,
    Color? hoverColor,
    Color? splashColor,
    Color? backgroundColor,
    Color? borderColor,
    double borderRadius = 10,
    VoidCallback? onTap,
    EdgeInsetsGeometry padding = const EdgeInsets.all(10),
    String? semanticLabel,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
  }) {
    // Implement network logic here
    return SvgIconButton(
      key: key,
      assetPath: fallbackAssetPath,
      size: size,
      color: color,
      hoverColor: hoverColor,
      splashColor: splashColor,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      borderRadius: borderRadius,
      onTap: onTap,
      padding: padding,
      semanticLabel: semanticLabel,
      fit: fit,
      alignment: alignment,
    );
  }
}
