import 'package:flutter/material.dart';
import 'package:portfolio/core/configs/app_sizes.dart';
import 'package:portfolio/domain/models/skills/skill_category.dart';

class SkillGridItem extends StatefulWidget {
  final SkillCategory category;

  const SkillGridItem({super.key, required this.category});

  @override
  State<SkillGridItem> createState() => _SkillGridItemState();
}

class _SkillGridItemState extends State<SkillGridItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: gridItemAnimationDuration),
        transform: Matrix4.identity()..scale(_isHovered ? gridItemScale : 1.0),
        child: Card(
          elevation: _isHovered ? gridItemHoverElevation : 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(gridItemBorderRadius),
            side: BorderSide(
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: _isHovered ? 0.2 : 0.1),
              width: gridItemBorderWidth,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(gridItemBorderRadius),
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.surface,
                  Theme.of(context).colorScheme.surfaceContainerHighest
                      .withValues(alpha: _isHovered ? 0.7 : 0.5),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(
                      milliseconds: gridItemAnimationDuration,
                    ),
                    right:
                        _isHovered
                            ? -gridItemIconPositionOffset
                            : -gridItemIconDefaultOffset,
                    top:
                        _isHovered
                            ? -gridItemIconPositionOffset
                            : -gridItemIconDefaultOffset,
                    child: AnimatedRotation(
                      duration: const Duration(
                        milliseconds: gridItemAnimationDuration,
                      ),
                      turns: _isHovered ? gridItemIconRotation : 0,
                      child: Icon(
                        widget.category.icon,
                        size: gridItemIconSize,
                        color: Theme.of(context).colorScheme.primary.withValues(
                          alpha: _isHovered ? 0.1 : 0.05,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(spacingM),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildHeader(context),
                        const SizedBox(height: spacingM),
                        _buildSkillList(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSkillList(BuildContext context) {
    return Wrap(
      spacing: spacingXS,
      runSpacing: spacingXS,
      children:
          widget.category.skills
              .map(
                (skill) => Chip(
                  label: Text(
                    skill,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                  side: BorderSide(
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.1),
                    width: 1,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
              .toList(),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(spacingXS),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            widget.category.icon,
            color: Theme.of(context).colorScheme.primary,
            size: 24,
          ),
        ),
        const SizedBox(width: spacingS),
        Expanded(
          child: Text(
            widget.category.title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            softWrap: true,
            overflow: TextOverflow.visible,
          ),
        ),
      ],
    );
  }
}
