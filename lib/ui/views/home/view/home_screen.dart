import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/configs/app_sizes.dart';
import 'package:portfolio/core/extensions/responsive_extension.dart';
import 'package:portfolio/ui/views/home/view_model/home_view_model.dart';
import 'package:portfolio/ui/views/home/widgets/carousel_indicators.dart';
import 'package:portfolio/ui/views/home/widgets/home_carousel.dart';
import 'package:portfolio/ui/views/home/widgets/speech_bubbles_layer.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(homeViewModelProvider);
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          HomeCarousel(
            onPageChanged:
                ref.read(homeViewModelProvider.notifier).setCurrentIndex,
          ),
          SpeechBubblesLayer(currentIndex: currentIndex),
          Positioned(
            bottom: context.isMobile ? 0 : spacingXL,
            left: 0,
            right: 0,
            child: CarouselIndicators(
              itemCount: HomeViewModel.slides.length,
              currentIndex: currentIndex,
            ),
          ),
        ],
      ),
    );
  }
}
