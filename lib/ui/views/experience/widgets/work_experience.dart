import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/configs/app_sizes.dart';
import 'package:portfolio/core/extensions/theme_ext.dart';
import 'package:portfolio/domain/models/experience/company.dart';
import 'package:portfolio/gen/locale_keys.g.dart';
import 'package:portfolio/ui/shared/widgets/glowing_avatar.dart';
import 'package:portfolio/ui/shared/widgets/info_content.dart';
import 'package:portfolio/ui/shared/widgets/timeline_widget.dart';
import 'package:portfolio/ui/views/experience/view_models/experience_view_model.dart';
import 'package:shimmer/shimmer.dart';

class WorkExperience extends ConsumerWidget {
  const WorkExperience({super.key});

  // Group related constants
  static const _layout = (
    titleFontSize: 18.0,
    shimmerItemCount: 10,
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

  Widget _buildShimmerCompanySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: spacingL,
          children: [
            const GlowingAvatar(imagePath: ''),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: spacingL,
                children: [
                  InfoContent(
                    period: _getRandomText(_layout.periodLength),
                    title: _getRandomText(_layout.titleLength),
                    subtitle: _getRandomText(_layout.subtitleLength),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLoadingShimmer(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: spacingM,
      children: [
        _buildTitle(context),
        _buildShimmerWrapper(
          theme: theme,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: spacingM,
            children: List.generate(
              _layout.shimmerItemCount,
              (index) => _buildShimmerCompanySection(),
            ),
          ),
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
    final companies = state.data?.companies;

    if (companies == null || companies.isEmpty) {
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: spacingM,
      children: [
        _buildTitle(context),
        ...companies.map((company) => _buildCompanySection(context, company)),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) => Text(
    LocaleKeys.experience_work_experience_title.tr(),
    style: context.textTheme.titleMedium?.copyWith(
      fontSize: 18,
      color: context.colorScheme.primary,
    ),
  );

  Widget _buildCompanySection(BuildContext context, Company company) {
    return Column(
      key: ValueKey(company.name),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: spacingL,
          children: [
            GlowingAvatar(imagePath: company.logo),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: spacingL,
                children: [
                  InfoContent(
                    period: company.period,
                    title: company.name,
                    subtitle: company.position,
                  ),
                  TimelineWidget(items: company.projects),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
