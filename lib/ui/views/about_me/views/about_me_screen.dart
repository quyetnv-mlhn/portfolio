import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:portfolio/core/configs/app_breakpoints.dart';
import 'package:portfolio/core/configs/app_sizes.dart';
import 'package:portfolio/core/enums/screen_type.dart';
import 'package:portfolio/gen/assets.gen.dart';
import 'package:portfolio/gen/locale_keys.g.dart';
import 'package:portfolio/ui/shared/widgets/responsive_container.dart';
import 'package:portfolio/ui/views/home/widgets/speech_bubble.dart';

class AboutMeScreen extends StatelessWidget {
  static const _spacingBetweenSections = spacingXL;
  static const _desktopImageTopPadding = 80.0;
  static const _speechBubbleRightPadding = 20.0;
  static const _mobileSpeechBubbleOffset = 90.0;

  const AboutMeScreen({super.key});

  ScreenType _getScreenType(double width) => switch (width) {
        <= AppBreakpoints.mobile => ScreenType.mobile,
        <= AppBreakpoints.tablet => ScreenType.tablet,
        <= AppBreakpoints.desktop => ScreenType.desktop,
        _ => ScreenType.desktopLarge,
      };

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final screenType = _getScreenType(constraints.maxWidth);
          final isDesktop = screenType.isDesktop;

          return Flex(
            direction: isDesktop ? Axis.horizontal : Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildImageSection(screenType, constraints, isDesktop),
              _buildSpacer(isDesktop),
              _buildContentSection(screenType, isDesktop),
            ],
          );
        },
      ),
    );
  }

  Widget _buildImageSection(
    ScreenType screenType,
    BoxConstraints constraints,
    bool isDesktop,
  ) =>
      Flexible(
        flex: isDesktop ? 1 : 0,
        child: ProfileImageSection(
          screenType: screenType,
          constraints: constraints,
        ),
      );

  Widget _buildSpacer(bool isDesktop) => SizedBox(
        width: isDesktop ? spacingXXL : 0,
        height: isDesktop ? 0 : _spacingBetweenSections,
      );

  Widget _buildContentSection(ScreenType screenType, bool isDesktop) =>
      Flexible(
        flex: isDesktop ? 1 : 0,
        child: AboutMeContent(screenType: screenType),
      );
}

class ProfileImageSection extends StatelessWidget {
  static const _imageWidthRatio = 0.7;

  final ScreenType screenType;
  final BoxConstraints constraints;

  const ProfileImageSection({
    required this.screenType,
    required this.constraints,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = screenType.isDesktop;
    return isLargeScreen
        ? _buildDesktopLayout(isLargeScreen)
        : _buildMobileLayout();
  }

  Widget _buildDesktopLayout(bool isLargeScreen) => Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: AboutMeScreen._desktopImageTopPadding,
            ),
            child: _buildImage(isLargeScreen),
          ),
          const Positioned(
            right: AboutMeScreen._speechBubbleRightPadding,
            top: 0,
            child: SpeechBubbleWidget(
              index: 0,
              textLines: [LocaleKeys.home_greeting],
            ),
          ),
        ],
      );

  Widget _buildMobileLayout() => const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: AboutMeScreen._mobileSpeechBubbleOffset),
          SpeechBubbleWidget(
            index: 0,
            textLines: [LocaleKeys.home_greeting],
          ),
        ],
      );

  Widget _buildImage(bool isLargeScreen) => Image.asset(
        Assets.images.chill.path,
        fit: BoxFit.contain,
        width: isLargeScreen ? null : constraints.maxWidth * _imageWidthRatio,
      );
}

class AboutMeContent extends StatelessWidget {
  static const _defaultTextStyle = TextStyle(fontSize: 18, height: 1.7);
  static const _titleStyle = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: Colors.blueAccent,
  );
  static const _animationSpeed = Duration(milliseconds: 100);
  static const _bulletPoint = "• ";

  final ScreenType screenType;

  const AboutMeContent({
    required this.screenType,
    super.key,
  });

  TextStyle _getBaseTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: _defaultTextStyle.fontSize,
              height: _defaultTextStyle.height,
            ) ??
        _defaultTextStyle;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildAnimatedTitle(),
        const SizedBox(height: spacingXL),
        _buildContentSection(context),
      ],
    );
  }

  Widget _buildAnimatedTitle() {
    return AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText(
          LocaleKeys.about_me_title.tr(),
          textStyle: _titleStyle,
          speed: _animationSpeed,
          cursor: '|',
          textAlign: TextAlign.center,
        ),
      ],
      isRepeatingAnimation: false,
      displayFullTextOnTap: true,
      stopPauseOnTap: true,
      repeatForever: false,
    );
  }

  // Keep this implementation
  Widget _buildBulletPoint(BuildContext context, {required Widget child}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: spacingL),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_bulletPoint, style: _getBaseTextStyle(context)),
          Expanded(child: child),
        ],
      ),
    );
  }

  // Remove the duplicate _buildBulletPoint method that was here

  Widget _buildHighlightedText(
    BuildContext context, {
    required String text,
    required Color backgroundColor,
    required TextStyle baseStyle,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            backgroundColor,
            backgroundColor.withValues(alpha: 0.3),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(text, style: baseStyle),
    );
  }

  Widget _buildContentSection(BuildContext context) {
    final baseStyle = _getBaseTextStyle(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildIntroSection(context, baseStyle),
        ..._buildBulletPoints(context, baseStyle),
      ],
    );
  }

  Widget _buildIntroSection(BuildContext context, TextStyle baseStyle) {
    return _buildBulletPoint(
      context,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(LocaleKeys.about_me_intro_part1.tr(), style: baseStyle),
          _buildHighlightedText(
            context,
            text: LocaleKeys.about_me_intro_role.tr(),
            backgroundColor: Colors.blue.shade200,
            baseStyle: baseStyle,
          ),
          Text(LocaleKeys.about_me_intro_part2.tr(), style: baseStyle),
          _buildHighlightedText(
            context,
            text: LocaleKeys.about_me_intro_exploring.tr(),
            backgroundColor: Colors.green.shade400,
            baseStyle: baseStyle,
          ),
          Text(LocaleKeys.about_me_intro_part3.tr(), style: baseStyle),
        ],
      ),
    );
  }

  List<Widget> _buildBulletPoints(BuildContext context, TextStyle baseStyle) {
    final bulletPoints = [
      LocaleKeys.about_me_bullet_point_1.tr(),
      LocaleKeys.about_me_bullet_point_2.tr(),
      LocaleKeys.about_me_bullet_point_3.tr(),
      LocaleKeys.about_me_bullet_point_4.tr(),
      LocaleKeys.about_me_bullet_point_5.tr(),
    ];

    return bulletPoints
        .map(
          (text) => _buildBulletPoint(
            context,
            child: Text(text, style: baseStyle),
          ),
        )
        .toList();
  }
}
