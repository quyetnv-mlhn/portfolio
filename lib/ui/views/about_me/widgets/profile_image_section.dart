import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/enums/screen_type.dart';
import 'package:portfolio/gen/assets.gen.dart';
import 'package:portfolio/ui/views/about_me/view_models/about_me_view_model.dart';
import 'package:portfolio/ui/views/home/widgets/speech_bubble.dart';

class ProfileImageSection extends ConsumerWidget {
  const ProfileImageSection({
    required this.screenType,
    required this.constraints,
    super.key,
  });

  final BoxConstraints constraints;
  final ScreenType screenType;

  static const _imageWidthRatio = 0.7;
  static const _desktopImageTopPadding = 80.0;
  static const _mobileSpeechBubbleOffset = 90.0;
  static const _speechBubbleRightPadding = 20.0;

  Widget _buildDesktopLayout(
    bool isLargeScreen,
    String imagePath,
    String greeting,
  ) => Stack(
    alignment: Alignment.topCenter,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: _desktopImageTopPadding),
        child: _buildImage(isLargeScreen, Assets.images.chill.path),
      ),
      Positioned(
        right: _speechBubbleRightPadding,
        top: 0,
        child: SpeechBubbleWidget(
          index: 0,
          textLines: [greeting],
          imagePath: imagePath,
        ),
      ),
    ],
  );

  Widget _buildMobileLayout(String greeting, String imagePath) => Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(width: _mobileSpeechBubbleOffset),
      SpeechBubbleWidget(index: 0, textLines: [greeting], imagePath: imagePath),
    ],
  );

  Widget _buildImage(bool isLargeScreen, String imagePath) => Image.asset(
    imagePath,
    fit: BoxFit.contain,
    width: isLargeScreen ? null : constraints.maxWidth * _imageWidthRatio,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagePath = ref.watch(
      aboutMeStateProvider.select((value) => value.value?.imagePath ?? ''),
    );
    final greeting = ref.watch(
      aboutMeStateProvider.select((value) => value.value?.greeting ?? ''),
    );

    if (imagePath.isEmpty || greeting.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    final isLargeScreen = screenType.isDesktop;
    return isLargeScreen
        ? _buildDesktopLayout(isLargeScreen, imagePath, greeting)
        : _buildMobileLayout(greeting, imagePath);
  }
}
