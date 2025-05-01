import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/configs/app_sizes.dart';
import 'package:portfolio/core/constants/constants.dart';
import 'package:portfolio/core/enums/screen_type.dart';
import 'package:portfolio/core/extensions/theme_ext.dart';
import 'package:portfolio/domain/models/skills/skill_category.dart';
import 'package:portfolio/gen/locale_keys.g.dart';
import 'package:portfolio/ui/shared/widgets/animated_title.dart';
import 'package:portfolio/ui/shared/widgets/responsive_container.dart';
import 'package:portfolio/ui/shared/widgets/typing_text.dart';
import 'package:portfolio/ui/views/skills/view_models/skills_view_model.dart';
import 'package:portfolio/ui/views/skills/widgets/skill_category_carousel.dart';
import 'package:portfolio/ui/views/skills/widgets/skill_grid.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  Map<ScreenType, double> get _horizontalPaddings => {
    ScreenType.mobile: 5,
    ScreenType.tablet: 20,
    ScreenType.desktop: 20,
    ScreenType.desktopLarge: 30,
  };

  double _getPaddingHorizontal(ScreenType screenType) =>
      _horizontalPaddings[screenType] ?? spacingM;

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final screenType = ScreenType.getScreenTypeFromWidth(
            constraints.maxWidth,
          );
          final horizontalPadding = _getPaddingHorizontal(screenType);

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: SkillsContent(screenType: screenType),
          );
        },
      ),
    );
  }
}

class SkillsContent extends ConsumerWidget {
  final ScreenType screenType;

  const SkillsContent({required this.screenType, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skillsAsync = ref.watch(skillsViewModelProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildTitle(context),
        const SizedBox(height: spacingM),
        _buildSubtitle(context),
        const SizedBox(height: spacingM),
        _buildDescription(context),
        const SizedBox(height: spacingXXL),
        _buildCarousel(skillsAsync),
        const SizedBox(height: spacingXXL),
        _buildGrid(skillsAsync),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return AnimatedTitle(
      text: LocaleKeys.skills_title.tr(),
      textStyle: context.textTheme.titleMedium?.copyWith(
        fontSize: Constants.titleFontSize,
        color: context.colorScheme.primary,
      ),
      animationSpeed: Constants.animationSpeed,
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    final subtitleStyle = context.textTheme.bodyLarge?.copyWith(
      fontWeight: FontWeight.w700,
    );

    return TypingText(
      text: LocaleKeys.skills_subtitle.tr(),
      textStyle: subtitleStyle,
      speed: Constants.typingSpeed,
      opacityDuration: Constants.opacityDuration,
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Text(
      LocaleKeys.skills_description.tr(),
      style: context.textTheme.bodyLarge,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildCarousel(AsyncValue<SkillCategoryResponse> skillsAsync) {
    return skillsAsync.when(
      data:
          (data) => SkillCategoryCarousel(
            categories: data.categories,
            isLoading: false,
          ),
      loading:
          () => const SkillCategoryCarousel(categories: [], isLoading: true),
      error: (_, __) => const SizedBox.shrink(),
    );
  }

  Widget _buildGrid(AsyncValue<SkillCategoryResponse> skillsAsync) {
    return skillsAsync.when(
      data:
          (data) => SkillGrid(
            categories: data.categories,
            screenType: screenType,
            isLoading: false,
          ),
      loading:
          () => SkillGrid(
            categories: [],
            screenType: screenType,
            isLoading: true,
          ),
      error: (_, __) => const SizedBox.shrink(),
    );
  }
}
