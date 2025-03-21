import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/configs/app_breakpoints.dart';
import 'package:portfolio/core/configs/app_sizes.dart';
import 'package:portfolio/core/enums/screen_type.dart';
import 'package:portfolio/core/extensions/theme_ext.dart';
import 'package:portfolio/gen/locale_keys.g.dart';
import 'package:portfolio/ui/shared/widgets/animated_title.dart';
import 'package:portfolio/ui/shared/widgets/responsive_container.dart';
import 'package:portfolio/ui/shared/widgets/typing_text.dart';
import 'package:portfolio/ui/views/experience/widgets/education.dart';
import 'package:portfolio/ui/views/experience/widgets/technical_profile.dart';
import 'package:portfolio/ui/views/experience/widgets/work_experience.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  ScreenType _getScreenType(double width) => switch (width) {
    <= AppBreakpoints.mobile => ScreenType.mobile,
    <= AppBreakpoints.tablet => ScreenType.tablet,
    <= AppBreakpoints.desktop => ScreenType.desktop,
    _ => ScreenType.desktopLarge,
  };

  double _getPaddingHorizontal(ScreenType screenType) => switch (screenType) {
    ScreenType.mobile => 20,
    ScreenType.tablet => 40,
    ScreenType.desktop => 60,
    ScreenType.desktopLarge => 80,
  };

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final screenType = _getScreenType(constraints.maxWidth);
          final horizontalPadding = _getPaddingHorizontal(screenType);

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: ExperienceContent(screenType: screenType),
          );
        },
      ),
    );
  }
}

class ExperienceContent extends StatelessWidget {
  final ScreenType screenType;
  const ExperienceContent({required this.screenType, super.key});

  static const _animationSpeed = Duration(milliseconds: 100);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AnimatedTitle(
            text: LocaleKeys.experience_title.tr(),
            textStyle: context.textTheme.titleMedium?.copyWith(
              fontSize: 36.0,
              color: context.colorScheme.primary,
            ),
            animationSpeed: _animationSpeed,
          ),
          const SizedBox(height: spacingM),
          _buildSubtitle(context),
          const SizedBox(height: spacingM),
          _buildDescription(context),
          const SizedBox(height: spacingXXL),
          const SizedBox(height: spacingXXL),
          const TechnicalProfile(),
          const SizedBox(height: spacingXXL),
          const Education(),
          const SizedBox(height: spacingXXL),
          WorkExperience(), // Add this line
        ],
      ),
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    final subtitleStyle = Theme.of(
      context,
    ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700);

    return TypingText(
      text: LocaleKeys.experience_subtitle.tr(),
      textStyle: subtitleStyle,
      speed: _animationSpeed * 2,
      opacityDuration: _animationSpeed * 10,
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Text(
      LocaleKeys.experience_description.tr(),
      style: Theme.of(context).textTheme.bodyLarge,
      textAlign: TextAlign.center,
    );
  }
}
