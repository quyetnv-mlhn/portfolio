import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIconButton extends StatelessWidget {
  final String assetPath;
  final double? size;
  final Color? color;
  final Color? hoverColor;
  final Color? splashColor;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final String? semanticLabel;
  final bool allowWebSecurity;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final WidgetBuilder? errorBuilder;

  const SvgIconButton({
    super.key,
    required this.assetPath,
    this.size = 24,
    this.color,
    this.hoverColor,
    this.splashColor,
    this.onTap,
    this.padding = const EdgeInsets.all(8),
    this.semanticLabel,
    this.allowWebSecurity = true,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.errorBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        borderRadius: BorderRadius.circular(48),
        hoverColor: hoverColor ?? Theme.of(context).hoverColor,
        splashColor: splashColor ?? Theme.of(context).splashColor,
        onTap: onTap,
        child: Padding(
          padding: padding,
          child: SvgPicture.asset(
            assetPath,
            width: size,
            height: size,
            colorFilter: color != null
                ? ColorFilter.mode(color!, BlendMode.srcIn)
                : null,
            semanticsLabel: semanticLabel,
            fit: fit,
            alignment: alignment,
            excludeFromSemantics: true,
            allowDrawingOutsideViewBox: false,
            placeholderBuilder: (context) => SizedBox(
              width: size,
              height: size,
              child: const CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
        ),
      ),
    );
  }

  // Network version
  SvgIconButton.network({
    super.key,
    required String url,
    required String fallbackAssetPath,
    this.size = 24,
    this.color,
    this.hoverColor,
    this.splashColor,
    this.onTap,
    this.padding = const EdgeInsets.all(8),
    this.semanticLabel,
    this.allowWebSecurity = true,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.errorBuilder,
  }) : assetPath = fallbackAssetPath {
    // Implement network loading logic with caching
  }
}
