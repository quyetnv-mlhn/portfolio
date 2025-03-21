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

class WorkExperience extends ConsumerWidget {
  const WorkExperience({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(experienceViewModelProvider);
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
