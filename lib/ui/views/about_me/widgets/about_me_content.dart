import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/configs/app_sizes.dart';
import 'package:portfolio/core/enums/screen_type.dart';
import 'package:portfolio/domain/models/about_me/about_me_data.dart';
import 'package:portfolio/gen/locale_keys.g.dart';
import 'package:portfolio/ui/views/about_me/view_models/about_me_view_model.dart';
import 'package:shimmer/shimmer.dart';

class AboutMeContent extends ConsumerStatefulWidget {
  const AboutMeContent({required this.screenType, super.key});

  final ScreenType screenType;

  @override
  ConsumerState<AboutMeContent> createState() => _AboutMeContentState();
}

class _AboutMeContentState extends ConsumerState<AboutMeContent>
    with SingleTickerProviderStateMixin {
  static const _animationSpeed = Duration(milliseconds: 120);
  static const _bulletPoint = "• ";
  static const _defaultTextStyle = TextStyle(fontSize: 18, height: 1.7);
  static const _highlightDuration = Duration(milliseconds: 1200);
  static const _initialDelay = Duration(milliseconds: 800);
  static const _titleStyle = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: Colors.blueAccent,
  );
  final random = Random();

  late AnimationController _contentAnimationController;
  bool _showTitle = false;

  @override
  void initState() {
    super.initState();
    _contentAnimationController = AnimationController(
      vsync: this,
      duration: _highlightDuration,
    );

    Future.delayed(_initialDelay, () {
      if (mounted) {
        setState(() {
          _showTitle = true;
          _contentAnimationController.forward();
        });
      }
    });
  }

  @override
  void dispose() {
    _contentAnimationController.dispose();
    super.dispose();
  }

  Widget _buildAnimatedTitle() {
    if (!_showTitle) {
      return Text('|', style: _titleStyle, textAlign: TextAlign.center);
    }

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
    );
  }

  Widget _buildHighlightedText({
    required String text,
    required Color backgroundColor,
    required TextStyle baseStyle,
  }) {
    return AnimatedBuilder(
      animation: _contentAnimationController,
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                backgroundColor,
                backgroundColor.withValues(alpha: 0.3),
                Colors.transparent,
              ],
              stops: [
                0.0,
                _contentAnimationController.value,
                _contentAnimationController.value,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(text, style: baseStyle),
        );
      },
    );
  }

  TextStyle _getBaseTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontSize: _defaultTextStyle.fontSize,
          height: _defaultTextStyle.height,
        ) ??
        _defaultTextStyle;
  }

  Widget _buildBulletPoint({required Widget child}) {
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

  Widget _buildIntroSection(AboutMeData data, TextStyle baseStyle) {
    return _buildBulletPoint(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: data.intro.part1, style: baseStyle),
            WidgetSpan(
              child: _buildHighlightedText(
                text: data.intro.role,
                backgroundColor: Colors.blue.shade200,
                baseStyle: baseStyle,
              ),
              alignment: PlaceholderAlignment.middle,
            ),
            TextSpan(text: data.intro.part2, style: baseStyle),
            WidgetSpan(
              child: _buildHighlightedText(
                text: data.intro.exploring,
                backgroundColor: Colors.green.shade400,
                baseStyle: baseStyle,
              ),
              alignment: PlaceholderAlignment.middle,
            ),
            TextSpan(text: data.intro.part3, style: baseStyle),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildBulletPoints(AboutMeData data, TextStyle baseStyle) {
    return data.bulletPoints
        .map((text) => _buildBulletPoint(child: Text(text, style: baseStyle)))
        .toList();
  }

  Widget _buildContentSection(AboutMeData data) {
    final baseStyle = _getBaseTextStyle(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildIntroSection(data, baseStyle),
        ..._buildBulletPoints(data, baseStyle),
      ],
    );
  }

  // Move random text generator to a separate method
  String _getRandomText([int? maxLength]) {
    final length = maxLength ?? random.nextInt(80) + 40;
    return List.filled(length, '█').join();
  }

  // Separate shimmer configuration into its own method
  Widget _buildShimmerContainer({
    required Widget child,
    required ThemeData theme,
  }) {
    return Shimmer.fromColors(
      baseColor: theme.colorScheme.surface,
      highlightColor: theme.colorScheme.surfaceContainerHighest,
      child: child,
    );
  }

  Widget _buildContentSectionShimmer() {
    final baseStyle = _getBaseTextStyle(context);
    final theme = Theme.of(context);

    return _buildShimmerContainer(
      theme: theme,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // First item longer for intro section
          _buildBulletPoint(child: Text(_getRandomText(100), style: baseStyle)),
          // Regular bullet points
          ...List.generate(
            6,
            (index) => _buildBulletPoint(
              child: Text(_getRandomText(), style: baseStyle),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final aboutMeState = ref.watch(aboutMeStateProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: spacingXL,
      children: [
        _buildAnimatedTitle(),
        aboutMeState.when(
          data: _buildContentSection,
          loading: () => _buildContentSectionShimmer(),
          error: (error, _) => Center(child: Text('Error: $error')),
        ),
      ],
    );
  }
}
