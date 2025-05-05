import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/configs/app_sizes.dart';
import 'package:portfolio/core/enums/screen_type.dart';
import 'package:portfolio/gen/locale_keys.g.dart';
import 'package:portfolio/ui/shared/widgets/animated_title.dart';
import 'package:portfolio/ui/shared/widgets/responsive_container.dart';
import 'package:portfolio/ui/shared/widgets/typing_text.dart';
import 'package:portfolio/ui/views/contact/widgets/contact_form.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  static const _animationSpeed = Duration(milliseconds: 100);

  EdgeInsets _getPadding(ScreenType screenType) {
    switch (screenType) {
      case ScreenType.mobile:
        return const EdgeInsets.symmetric(
          horizontal: spacingL,
          vertical: spacingM,
        );
      case ScreenType.tablet:
        return const EdgeInsets.symmetric(
          horizontal: spacingXL,
          vertical: spacingL,
        );
      case ScreenType.desktop:
        return const EdgeInsets.symmetric(
          horizontal: spacingXXL,
          vertical: spacingXL,
        );
      case ScreenType.desktopLarge:
        return const EdgeInsets.symmetric(
          horizontal: spacingXXL * 2,
          vertical: spacingXXL,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final screenType = ScreenType.getScreenTypeFromWidth(
            constraints.maxWidth,
          );

          return Padding(
            padding: _getPadding(screenType),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AnimatedTitle(
                  text: LocaleKeys.contact_with_me.tr(),
                  textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 36.0,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  animationSpeed: _animationSpeed,
                ),
                const SizedBox(height: spacingM),
                _buildSubtitle(context),
                const SizedBox(height: spacingM),
                _buildDescription(context),
                const SizedBox(height: spacingXXL),
                const SizedBox(height: spacingXXL),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenType.isDesktop ? spacingXXL : spacingL,
                  ),
                  child: ContactForm(screenType: screenType),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    final subtitleStyle = Theme.of(
      context,
    ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700);

    return TypingText(
      text: LocaleKeys.contact_subtitle.tr(),
      textStyle: subtitleStyle,
      speed: _animationSpeed * 2,
      opacityDuration: _animationSpeed * 10,
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Text(
      LocaleKeys.contact_description.tr(),
      style: Theme.of(context).textTheme.bodyLarge,
      textAlign: TextAlign.center,
    );
  }
}
