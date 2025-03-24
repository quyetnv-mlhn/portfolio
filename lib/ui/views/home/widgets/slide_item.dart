import 'package:flutter/material.dart';
import 'package:portfolio/domain/models/home/home_data.dart';

class SlideItem extends StatelessWidget {
  final SlideData data;

  const SlideItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 550,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(data.image),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
