import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/configs/app_sizes.dart';
import 'package:portfolio/core/extensions/theme_ext.dart';
import 'package:portfolio/domain/models/experience/education.dart';
import 'package:portfolio/gen/locale_keys.g.dart';
import 'package:portfolio/ui/shared/widgets/section_info.dart';
import 'package:portfolio/ui/views/experience/view_models/experience_view_model.dart';
import 'package:shimmer/shimmer.dart';

class Education extends ConsumerWidget {
  const Education({super.key});

  // Group related constants
  static const _textSizes = (
    titleFontSize: 18.0,
    periodLength: 10,
    titleLength: 30,
    subtitleLength: 40,
  );

  String _getRandomText([int? maxLength]) {
    final random = Random();
    final length = maxLength ?? random.nextInt(40) + 20;
    return List.filled(length, '█').join();
  }

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

  Widget _buildShimmerEducationItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: spacingM,
      children: [
        SectionInfo(
          period: _getRandomText(_textSizes.periodLength),
          title: _getRandomText(_textSizes.titleLength),
          subtitle: _getRandomText(_textSizes.subtitleLength),
          imagePath: '',
        ),
      ],
    );
  }

  Widget _buildLoadingShimmer(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: spacingL,
      children: [
        _buildTitle(context),
        _buildShimmerWrapper(
          theme: theme,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: spacingL,
            children: [_buildShimmerEducationItem()],
          ),
        ),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) => Text(
    LocaleKeys.experience_education_title.tr(),
    style: context.textTheme.titleMedium?.copyWith(
      fontSize: _textSizes.titleFontSize,
      color: context.colorScheme.primary,
    ),
  );

  Widget _buildEducationItem(BuildContext context, EducationModel education) {
    return Column(
      key: ValueKey(education.university),
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: spacingM,
      children: [
        SectionInfo(
          period: education.period,
          title: education.major,
          subtitle: education.university,
          imagePath: education.image,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(experienceViewModelProvider);

    if (state.isLoading) {
      return _buildLoadingShimmer(context);
    }

    final educationInfo = state.data?.education;
    if (educationInfo == null || educationInfo.isEmpty) {
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: spacingL,
      children: [
        _buildTitle(context),
        ...educationInfo.map(
          (education) => _buildEducationItem(context, education),
        ),
      ],
    );
  }
}
