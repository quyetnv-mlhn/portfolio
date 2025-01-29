import 'package:flutter/material.dart';
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
    return Stack(
      children: HomeViewmodel.slides.asMap().entries.map((entry) {
        final index = entry.key;
        final slide = entry.value;

        return Positioned(
          left: slide.positionX,
          top: slide.positionY,
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
