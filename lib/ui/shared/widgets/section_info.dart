import 'package:flutter/material.dart';
import 'package:portfolio/core/configs/app_sizes.dart';
import 'package:portfolio/ui/shared/widgets/glowing_avatar.dart';
import 'package:portfolio/ui/shared/widgets/info_content.dart';

class SectionInfo extends StatelessWidget {
  final String period;
  final String title;
  final String subtitle;
  final TextStyle? periodStyle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final String? imagePath;
  final double imageSize;
  final double? leadingSpacing;
  final bool withGlowingBorder;

  const SectionInfo({
    required this.period,
    required this.title,
    required this.subtitle,
    this.periodStyle,
    this.titleStyle,
    this.subtitleStyle,
    this.imagePath,
    this.imageSize = 73,
    this.leadingSpacing = spacingL,
    this.withGlowingBorder = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (imagePath != null) ...[
          GlowingAvatar(
            imagePath: imagePath!,
            size: imageSize,
            withGlowingBorder: withGlowingBorder,
          ),
          SizedBox(width: leadingSpacing),
        ],
        Expanded(
          child: InfoContent(
            period: period,
            title: title,
            subtitle: subtitle,
            periodStyle: periodStyle,
            titleStyle: titleStyle,
            subtitleStyle: subtitleStyle,
          ),
        ),
      ],
    );
  }
}
