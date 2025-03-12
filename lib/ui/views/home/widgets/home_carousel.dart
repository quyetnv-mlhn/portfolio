import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/ui/views/home/view_model/home_view_model.dart';
import 'package:portfolio/ui/views/home/widgets/slide_item.dart';

class HomeCarousel extends StatelessWidget {
  final void Function(int) onPageChanged;

  const HomeCarousel({super.key, required this.onPageChanged});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CarouselSlider.builder(
          itemCount: HomeViewModel.slides.length,
          options: CarouselOptions(
            height: constraints.maxHeight,
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            onPageChanged: (index, _) => onPageChanged(index),
          ),
          itemBuilder: (context, index, _) {
            return SlideItem(data: HomeViewModel.slides[index]);
          },
        );
      },
    );
  }
}
