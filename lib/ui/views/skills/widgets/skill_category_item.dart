import 'package:flutter/material.dart';
import 'package:portfolio/core/configs/app_sizes.dart';
import 'package:portfolio/core/constants/constants.dart';
import 'package:portfolio/ui/views/skills/models/skill_item_with_icon.dart';

class SkillCategoryItem extends StatefulWidget {
  final SkillItemWithIcon skill;
  final Color? color;

  const SkillCategoryItem({super.key, required this.skill, this.color});

  @override
  SkillCategoryItemState createState() => SkillCategoryItemState();
}

class SkillCategoryItemState extends State<SkillCategoryItem> {
  bool _isHovered = false;

  List<BoxShadow> _buildShadows(Color color) {
    const shadowOffsets = [2.0, 4.0, 6.0, 8.0];
    const shadowOpacities = [0.8, 0.6, 0.4, 0.2];

    return List.generate(
      shadowOffsets.length,
      (index) => BoxShadow(
        color: color.withValues(alpha: shadowOpacities[index]),
        offset: Offset(0, shadowOffsets[index]),
        blurRadius: 0,
        spreadRadius: 0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.colorScheme.onSurface;
    final iconColor = theme.colorScheme.primary;
    final color = widget.color ?? textColor;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: Constants.skillItemHoverDuration,
        curve: Constants.skillItemHoverCurve,
        margin: const EdgeInsets.symmetric(horizontal: skillItemSpacing),
        transform: Matrix4.translationValues(
          0,
          _isHovered ? skillItemHoverOffset : 0,
          0,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: spacingM,
          vertical: spacingXS,
        ),
        decoration: BoxDecoration(
          color: _isHovered ? color.withValues(alpha: 0.5) : Colors.transparent,
          borderRadius: BorderRadius.circular(radiusS),
          border: Border.all(color: textColor, width: borderWidth),
          boxShadow: _isHovered ? _buildShadows(color) : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(widget.skill.icon, color: iconColor),
            const SizedBox(width: skillItemIconSpacing),
            Text(
              widget.skill.name,
              style: theme.textTheme.labelLarge?.copyWith(
                color: textColor,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
