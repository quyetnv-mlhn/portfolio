import 'package:flutter/material.dart';
import 'package:portfolio/core/configs/app_sizes.dart';

class CarouselIndicators extends StatelessWidget {
  final int itemCount;
  final int currentIndex;

  const CarouselIndicators({
    super.key,
    required this.itemCount,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemCount,
        (index) => Container(
          width: currentIndex == index ? spacingXL : spacingS,
          height: spacingS,
          margin: const EdgeInsets.symmetric(horizontal: spacingXS),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radiusM),
            color: theme.colorScheme.primary.withValues(
              alpha: currentIndex == index ? 1 : 0.4,
            ),
          ),
        ),
      ),
    );
  }
}
