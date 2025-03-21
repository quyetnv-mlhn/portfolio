import 'package:flutter/material.dart';
import 'package:portfolio/core/configs/app_sizes.dart';
import 'package:portfolio/core/extensions/theme_ext.dart';

class InfoContent extends StatelessWidget {
  final String period;
  final String title;
  final String subtitle;
  final TextStyle? periodStyle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  const InfoContent({
    required this.period,
    required this.title,
    required this.subtitle,
    this.periodStyle,
    this.titleStyle,
    this.subtitleStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: spacingXS,
      children: [
        PeriodText(period: period, style: periodStyle),
        TitleSubtitleText(
          title: title,
          subtitle: subtitle,
          titleStyle: titleStyle,
          subtitleStyle: subtitleStyle,
        ),
      ],
    );
  }
}

class PeriodText extends StatelessWidget {
  final String period;
  final TextStyle? style;

  const PeriodText({required this.period, this.style, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      period,
      style:
          style ??
          context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
    );
  }
}

class TitleSubtitleText extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  const TitleSubtitleText({
    required this.title,
    required this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: title,
            style:
                titleStyle ??
                context.textTheme.titleMedium?.copyWith(
                  color: context.colorScheme.primary,
                ),
          ),
          TextSpan(text: " | ", style: context.textTheme.titleMedium),
          TextSpan(
            text: subtitle,
            style:
                subtitleStyle ??
                context.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
          ),
        ],
      ),
    );
  }
}
