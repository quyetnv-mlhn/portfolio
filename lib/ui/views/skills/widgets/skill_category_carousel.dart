import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/core/configs/app_sizes.dart';
import 'package:portfolio/core/constants/constants.dart';
import 'package:portfolio/domain/models/skills/skill_category.dart';
import 'package:portfolio/ui/views/skills/models/skill_item_with_icon.dart';
import 'package:portfolio/ui/views/skills/widgets/skill_category_item.dart';
import 'package:shimmer/shimmer.dart';

class SkillCategoryCarousel extends StatefulWidget {
  final List<SkillCategory> categories;
  final bool isLoading;

  const SkillCategoryCarousel({
    super.key,
    required this.categories,
    this.isLoading = false,
  });

  @override
  State<SkillCategoryCarousel> createState() => _SkillCategoryCarouselState();
}

class _SkillCategoryCarouselState extends State<SkillCategoryCarousel>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final ScrollController _topScroll, _bottomScroll;
  final _topCats = <SkillItemWithIcon>[];
  final _bottomCats = <SkillItemWithIcon>[];
  final _colorNotifiers = <int, ValueNotifier<Color?>>{};
  final _random = Random();
  bool _pausedTop = false, _pausedBottom = false;
  final _stepScroll = Constants.carouselScrollSpeed;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(
            vsync: this,
            duration: Constants.carouselAnimationDuration,
          )
          ..addListener(_onTick)
          ..repeat();
    _topScroll = ScrollController();
    _bottomScroll = ScrollController();
    _splitCategories();
  }

  @override
  void didUpdateWidget(SkillCategoryCarousel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.categories != widget.categories) {
      _topCats
        ..clear()
        ..addAll(_splitSkills(even: true));
      _bottomCats
        ..clear()
        ..addAll(_splitSkills(even: false));
    }
  }

  List<SkillItemWithIcon> _splitSkills({required bool even}) {
    return widget.categories.expand((cat) {
        return cat.skills
            .asMap()
            .entries
            .where((entry) => (entry.key.isEven == even))
            .map((entry) => SkillItemWithIcon(entry.value, cat.icon));
      }).toList()
      ..shuffle();
  }

  void _splitCategories() {
    _topCats.addAll(_splitSkills(even: true));
    _bottomCats.addAll(_splitSkills(even: false));
  }

  void _onTick() {
    _scroll(_topScroll, _pausedTop);
    _scroll(_bottomScroll, _pausedBottom);
  }

  void _scroll(ScrollController controller, bool paused) {
    if (controller.hasClients && !paused) {
      controller.jumpTo(controller.offset + _stepScroll);
    }
  }

  Color _randomColor() => Color.fromRGBO(
    _random.nextInt(256),
    _random.nextInt(256),
    _random.nextInt(256),
    1,
  );

  @override
  void dispose() {
    _controller.dispose();
    _topScroll.dispose();
    _bottomScroll.dispose();
    for (final notifier in _colorNotifiers.values) {
      notifier.dispose();
    }
    super.dispose();
  }

  Shader _edgeFadeShader(Rect bounds) {
    return const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Colors.transparent,
        Colors.white,
        Colors.white,
        Colors.transparent,
      ],
      stops: [0.0, 0.1, 0.9, 1.0],
    ).createShader(bounds);
  }

  Widget _buildShimmerWrapper(ThemeData theme, Widget child) {
    return Shimmer.fromColors(
      baseColor: theme.colorScheme.surface,
      highlightColor: theme.colorScheme.surfaceContainerHighest,
      child: child,
    );
  }

  String _getRandomText() => List.filled(_random.nextInt(20) + 10, '█').join();

  Widget _buildLoadingRow(bool isTopRow) {
    final theme = Theme.of(context);
    return ShaderMask(
      shaderCallback: _edgeFadeShader,
      blendMode: BlendMode.dstIn,
      child: SizedBox(
        height: skillItemHeight,
        child: _buildShimmerWrapper(
          theme,
          ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            reverse: isTopRow,
            itemCount: 8,
            itemBuilder:
                (_, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: spacingM,
                      vertical: spacingXS,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: theme.colorScheme.onSurface,
                        width: 0.7,
                      ),
                      borderRadius: BorderRadius.circular(radiusS),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.circle, color: theme.colorScheme.primary),
                        const SizedBox(width: 8),
                        Text(
                          _getRandomText(),
                          style: theme.textTheme.labelLarge,
                        ),
                      ],
                    ),
                  ),
                ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isLoading) {
      return Column(
        spacing: spacingXS,
        mainAxisSize: MainAxisSize.min,
        children: [_buildLoadingRow(true), _buildLoadingRow(false)],
      );
    }

    if (widget.categories.isEmpty) return const SizedBox.shrink();

    return Column(
      spacing: spacingXS,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildSkillRow(_topCats, _topScroll, true),
        _buildSkillRow(_bottomCats, _bottomScroll, false),
      ],
    );
  }

  Widget _buildSkillRow(
    List<SkillItemWithIcon> skills,
    ScrollController controller,
    bool isTopRow,
  ) {
    if (skills.isEmpty) return const SizedBox.shrink();

    return ShaderMask(
      shaderCallback: _edgeFadeShader,
      blendMode: BlendMode.dstIn,
      child: SizedBox(
        height: skillItemHeight,
        child: ListView.builder(
          controller: controller,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          reverse: isTopRow,
          itemBuilder: (_, index) {
            final skill = skills[index % skills.length];
            return _buildSkillItem(skill, isTopRow);
          },
        ),
      ),
    );
  }

  void _setPaused(bool paused, bool isTopRow) {
    setState(() {
      if (isTopRow) {
        _pausedTop = paused;
      } else {
        _pausedBottom = paused;
      }
    });
  }

  Widget _buildSkillItem(SkillItemWithIcon skill, bool isTopRow) {
    final key = skill.name.hashCode;
    _colorNotifiers.putIfAbsent(key, () => ValueNotifier<Color?>(null));

    return MouseRegion(
      onEnter: (_) {
        _colorNotifiers[key]!.value = _randomColor();
        _setPaused(true, isTopRow);
      },
      onExit: (_) {
        _colorNotifiers[key]!.value = null;
        _setPaused(false, isTopRow);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: spacingXS),
        child: ValueListenableBuilder<Color?>(
          valueListenable: _colorNotifiers[key]!,
          builder:
              (_, color, __) => SkillCategoryItem(skill: skill, color: color),
        ),
      ),
    );
  }
}
