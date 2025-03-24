import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/domain/models/home/home_data.dart';
import 'package:portfolio/ui/views/home/widgets/slide_item.dart';

class HomeCarousel extends StatelessWidget {
  final List<SlideData> slides;
  final void Function(int) onPageChanged;

  const HomeCarousel({
    super.key,
    required this.slides,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CarouselSlider.builder(
          itemCount: slides.length,
          options: CarouselOptions(
            height: constraints.maxHeight,
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            onPageChanged: (index, _) => onPageChanged(index),
          ),
          itemBuilder: (context, index, _) {
            return SlideItem(data: slides[index]);
          },
        );
      },
    );
  }
}
