import 'package:flutter/material.dart';
import 'package:portfolio/core/extensions/responsive_extension.dart';
import 'package:portfolio/domain/models/home/home_data.dart';
import 'package:portfolio/ui/views/home/widgets/speech_bubble.dart';

class SpeechBubblesLayer extends StatelessWidget {
  final List<SlideData> slides;
  final int currentIndex;
  final String avatarPath;

  const SpeechBubblesLayer({
    super.key,
    required this.slides,
    required this.currentIndex,
    required this.avatarPath,
  });

  @override
  Widget build(BuildContext context) {
    final centerPosition = context.width / 2 - 35;
    final width = context.width;
    final height = context.height;

    return Stack(
      children:
          slides.asMap().entries.map((entry) {
            final index = entry.key;
            final slide = entry.value;

            final left = width * slide.position.x;
            final top = height * slide.position.y;

            return Positioned(
              left: context.isMobile ? centerPosition : left,
              top: context.isMobile ? null : top,
              bottom: context.isMobile ? 30 : null,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 400),
                opacity: currentIndex == index ? 1.0 : 0.0,
                child: SpeechBubbleWidget(
                  textLines: slide.messages,
                  index: index,
                  imagePath: avatarPath,
                ),
              ),
            );
          }).toList(),
    );
  }
}
