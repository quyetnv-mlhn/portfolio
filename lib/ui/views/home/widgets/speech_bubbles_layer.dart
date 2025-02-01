import 'package:flutter/material.dart';
import 'package:portfolio/core/extensions/responsive_extension.dart';
import 'package:portfolio/ui/views/home/viewmodel/home_viewmodel.dart';
import 'package:portfolio/ui/views/home/widgets/speech_bubble.dart';

class SpeechBubblesLayer extends StatelessWidget {
  final int currentIndex;

  const SpeechBubblesLayer({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final centerPosition = context.width / 2 - 35;
    return Stack(
      children: HomeViewmodel.slides.asMap().entries.map((entry) {
        final index = entry.key;
        final slide = entry.value;

        return Positioned(
          left: context.isMobile ? centerPosition : slide.positionX,
          top: context.isMobile ? null : slide.positionY,
          bottom: context.isMobile ? 30 : null,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 400),
            opacity: currentIndex == index ? 1.0 : 0.0,
            child: SpeechBubbleWidget(
              textLines: slide.messages,
              index: index,
            ),
          ),
        );
      }).toList(),
    );
  }
}
