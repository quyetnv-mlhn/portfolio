import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/configs/app_sizes.dart';
import 'package:portfolio/ui/views/home/viewmodel/home_viewmodel.dart';
import 'package:portfolio/ui/views/home/widgets/carousel_indicators.dart';
import 'package:portfolio/ui/views/home/widgets/slide_item.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(homeViewmodelProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacingXXL),
      child: Stack(
        children: [
          // Background Carousel
          CarouselSlider.builder(
            itemCount: HomeViewmodel.slides.length,
            options: CarouselOptions(
              height: double.infinity,
              viewportFraction: 1,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              onPageChanged: (index, _) {
                ref.read(homeViewmodelProvider.notifier).setCurrentIndex(index);
              },
            ),
            itemBuilder: (context, index, _) {
              return SlideItem(
                data: HomeViewmodel.slides[index],
              );
            },
          ),

          // Carousel Indicators
          Positioned(
            bottom: spacingXL,
            left: 0,
            right: 0,
            child: CarouselIndicators(
              itemCount: HomeViewmodel.slides.length,
              currentIndex: currentIndex,
            ),
          ),
        ],
      ),
    );
  }
}
