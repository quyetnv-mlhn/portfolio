import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/ui/views/home/viewmodel/home_viewmodel.dart';
import 'package:portfolio/ui/views/home/widgets/slide_item.dart';

class HomeCarousel extends ConsumerWidget {
  final void Function(int) onPageChanged;

  const HomeCarousel({
    super.key,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CarouselSlider.builder(
      itemCount: HomeViewmodel.slides.length,
      options: CarouselOptions(
        height: double.infinity,
        viewportFraction: 1,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        onPageChanged: (index, _) => onPageChanged(index),
      ),
      itemBuilder: (context, index, _) {
        return SlideItem(
          data: HomeViewmodel.slides[index],
        );
      },
    );
  }
}
