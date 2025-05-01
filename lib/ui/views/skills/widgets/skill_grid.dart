import 'package:flutter/material.dart';
import 'package:portfolio/core/configs/app_sizes.dart';
import 'package:portfolio/core/enums/screen_type.dart';
import 'package:portfolio/domain/models/skills/skill_category.dart';
import 'package:portfolio/ui/views/skills/widgets/skill_grid_item.dart';
import 'package:shimmer/shimmer.dart';

class SkillGrid extends StatelessWidget {
  final List<SkillCategory> categories;
  final ScreenType screenType;
  final bool isLoading;

  const SkillGrid({
    super.key,
    required this.categories,
    required this.screenType,
    this.isLoading = false,
  });

  Widget _buildShimmerWrapper({
    required ThemeData theme,
    required Widget child,
  }) {
    return Shimmer.fromColors(
      baseColor: theme.colorScheme.surface,
      highlightColor: theme.colorScheme.surfaceContainerHighest,
      child: child,
    );
  }

  Widget _buildLoadingGrid(
    BuildContext context,
    double spacing,
    int itemsPerRow,
  ) {
    final theme = Theme.of(context);
    final rows = <Widget>[];

    for (var i = 0; i < 6; i++) {
      final rowItems = List.generate(
        itemsPerRow,
        (index) => Expanded(
          flex: 1,
          child: Container(
            height: gridItemHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(gridItemBorderRadius),
              border: Border.all(
                color: theme.colorScheme.onSurface,
                width: borderWidth,
              ),
            ),
          ),
        ),
      );

      rows.add(
        Row(
          children: [
            for (var j = 0; j < rowItems.length; j++) ...[
              if (j > 0) SizedBox(width: spacing),
              rowItems[j],
            ],
          ],
        ),
      );

      if (i < 5) {
        rows.add(SizedBox(height: spacing));
      }
    }

    return _buildShimmerWrapper(theme: theme, child: Column(children: rows));
  }

  @override
  Widget build(BuildContext context) {
    final spacing = switch (screenType) {
      ScreenType.mobile => spacingM,
      _ => spacingL,
    };

    return LayoutBuilder(
      builder: (context, constraints) {
        final itemsPerRow = switch (screenType) {
          ScreenType.mobile => 1,
          ScreenType.tablet => 2,
          ScreenType.desktop => 3,
          ScreenType.desktopLarge => 4,
        };

        if (isLoading) {
          return _buildLoadingGrid(context, spacing, itemsPerRow);
        }

        final itemWidth =
            (constraints.maxWidth - (spacing * (itemsPerRow - 1))) /
            itemsPerRow;
        final rows = <Widget>[];

        for (var i = 0; i < categories.length; i += itemsPerRow) {
          final rowItems =
              categories.skip(i).take(itemsPerRow).map((category) {
                return SizedBox(
                  width: itemWidth,
                  child: SkillGridItem(category: category),
                );
              }).toList();

          rows.add(
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (var j = 0; j < rowItems.length; j++) ...[
                    if (j > 0) SizedBox(width: spacing),
                    Expanded(
                      flex: (constraints.maxWidth / itemsPerRow).floor(),
                      child: rowItems[j],
                    ),
                  ],
                ],
              ),
            ),
          );

          if (i + itemsPerRow < categories.length) {
            rows.add(SizedBox(height: spacing));
          }
        }

        return Column(children: rows);
      },
    );
  }
}
