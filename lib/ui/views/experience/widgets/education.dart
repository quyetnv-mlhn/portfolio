import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/configs/app_sizes.dart';
import 'package:portfolio/core/extensions/theme_ext.dart';
import 'package:portfolio/domain/models/experience/education.dart';
import 'package:portfolio/gen/locale_keys.g.dart';
import 'package:portfolio/ui/shared/widgets/section_info.dart';
import 'package:portfolio/ui/views/experience/view_models/experience_view_model.dart';

class Education extends ConsumerWidget {
  const Education({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final educationInfo = ref.watch(
      experienceViewModelProvider.select((value) => value.data?.education),
    );

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

  Widget _buildTitle(BuildContext context) => Text(
    LocaleKeys.experience_education_title.tr(),
    style: context.textTheme.titleMedium?.copyWith(
      fontSize: 18,
      color: context.colorScheme.primary,
    ),
  );

  Widget _buildEducationItem(BuildContext context, EducationModel education) =>
      Column(
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
