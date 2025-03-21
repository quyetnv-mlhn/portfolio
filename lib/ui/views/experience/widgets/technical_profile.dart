import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/configs/app_sizes.dart';
import 'package:portfolio/core/extensions/theme_ext.dart';
import 'package:portfolio/gen/locale_keys.g.dart';
import 'package:portfolio/ui/views/experience/view_models/experience_view_model.dart';

class TechnicalProfile extends ConsumerWidget {
  const TechnicalProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(experienceViewModelProvider);

    final technicalSkills = state.data?.technicalProfile;

    if (technicalSkills == null || technicalSkills.isEmpty) {
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: spacingM,
      children: [
        _buildTitle(context),
        ..._buildProfileItems(context, technicalSkills),
      ],
    );
  }

  Text _buildTitle(BuildContext context) {
    return Text(
      LocaleKeys.experience_technical_profile.tr(),
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        fontSize: 18,
        color: context.colorScheme.primary,
      ),
    );
  }

  List<Widget> _buildProfileItems(
    BuildContext context,
    List<String> technicalSkills,
  ) {
    final textStyle = context.textTheme.bodyLarge;
    final items = List.generate(
      technicalSkills.length,
      (index) => _buildProfileItem(technicalSkills[index], textStyle),
    );

    return items;
  }

  Widget _buildProfileItem(String text, TextStyle? style) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: spacingXS),
          child: Icon(Icons.circle, size: iconSizeS / 2),
        ),
        const SizedBox(width: spacingS),
        Expanded(child: Text(text, style: style)),
      ],
    );
  }
}
