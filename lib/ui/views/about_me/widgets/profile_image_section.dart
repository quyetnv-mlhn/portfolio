import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/enums/screen_type.dart';
import 'package:portfolio/gen/assets.gen.dart';
import 'package:portfolio/ui/shared/widgets/custom_loading.dart';
import 'package:portfolio/ui/views/about_me/view_models/about_me_view_model.dart';
import 'package:portfolio/ui/views/home/widgets/speech_bubble.dart';

class ProfileImageSection extends ConsumerWidget {
  const ProfileImageSection({
    required this.screenType,
    required this.constraints,
    super.key,
  });

  // Group related constants together
  static const _layout = (
    imageWidthRatio: 0.7,
    desktopImageTopPadding: 80.0,
    mobileSpeechBubbleOffset: 90.0,
    speechBubbleRightPadding: 20.0,
  );

  final BoxConstraints constraints;
  final ScreenType screenType;

  // Extract speech bubble creation to a separate method
  Widget _buildSpeechBubble(String greeting, String imagePath) {
    return SpeechBubbleWidget(
      index: 0,
      textLines: [greeting],
      imagePath: imagePath,
    );
  }

  Widget _buildDesktopLayout(
    bool isLargeScreen,
    String imagePath,
    String greeting,
  ) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: EdgeInsets.only(top: _layout.desktopImageTopPadding),
          child: _buildImage(isLargeScreen, Assets.images.chill.path),
        ),
        Positioned(
          right: _layout.speechBubbleRightPadding,
          top: 0,
          child: _buildSpeechBubble(greeting, imagePath),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(String greeting, String imagePath) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: _layout.mobileSpeechBubbleOffset),
        _buildSpeechBubble(greeting, imagePath),
      ],
    );
  }

  Widget _buildImage(bool isLargeScreen, String imagePath) {
    final imageWidth =
        isLargeScreen ? null : constraints.maxWidth * _layout.imageWidthRatio;

    return Image.asset(imagePath, fit: BoxFit.contain, width: imageWidth);
  }

  Widget _buildLoadingSection(bool isLargeScreen) {
    final loadingSize = Size(constraints.maxWidth, 200);
    return CustomLoading(size: isLargeScreen ? null : loadingSize);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final aboutMeAsync = ref.watch(aboutMeStateProvider);
    final isLargeScreen = screenType.isDesktop;

    return aboutMeAsync.when(
      data:
          (data) =>
              isLargeScreen
                  ? _buildDesktopLayout(
                    isLargeScreen,
                    data.imagePath,
                    data.greeting,
                  )
                  : _buildMobileLayout(data.greeting, data.imagePath),
      error: (_, __) => const SizedBox(),
      loading: () => _buildLoadingSection(isLargeScreen),
    );
  }
}
