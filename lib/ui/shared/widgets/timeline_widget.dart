import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/configs/app_sizes.dart';
import 'package:portfolio/core/extensions/theme_ext.dart';
import 'package:portfolio/core/utils/tech_icons.dart';
import 'package:portfolio/domain/models/experience/timeline_item.dart';
import 'package:portfolio/gen/locale_keys.g.dart';
import 'package:portfolio/ui/shared/widgets/info_content.dart';
import 'package:url_launcher/url_launcher.dart';

class TimelineWidget extends StatelessWidget {
  final List<TimelineItem> items;

  const TimelineWidget({required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder:
          (context, index) => TimelineTile(
            isFirst: index == 0,
            isLast: index == items.length - 1,
            item: items[index],
          ),
    );
  }
}

class TimelineTile extends StatelessWidget {
  static const _periodColumnWidth = 96.0;
  static const _lineWidth = 2.0;

  final bool isFirst;
  final bool isLast;
  final TimelineItem item;

  const TimelineTile({
    required this.isFirst,
    required this.isLast,
    required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: spacingS,
        children: [
          _buildPeriod(context),
          _buildTimelineLine(context),
          _buildContent(context),
        ],
      ),
    );
  }

  Widget _buildPeriod(BuildContext context) => SizedBox(
    width: _periodColumnWidth,
    child: Text(
      item.period,
      style: context.textTheme.titleSmall?.copyWith(
        color: context.colorScheme.primary,
      ),
    ),
  );

  Widget _buildTimelineLine(BuildContext context) => Column(
    children: [
      _buildUpperLine(context),
      _buildDot(context),
      _buildLowerLine(context),
    ],
  );

  Widget _buildUpperLine(BuildContext context) => Container(
    width: _lineWidth,
    height: spacingXXS,
    color: isFirst ? Colors.transparent : context.colorScheme.primary,
  );

  Widget _buildDot(BuildContext context) => Container(
    width: iconSizeXS,
    height: iconSizeXS,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: context.colorScheme.primary,
    ),
  );

  Widget _buildLowerLine(BuildContext context) => Expanded(
    child: Container(width: _lineWidth, color: context.colorScheme.primary),
  );

  Widget _buildContent(BuildContext context) => Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: spacingM,
      children: [
        _buildHeader(context),
        _buildDescription(context),
        _buildStoreLinks(context),
        if (item.mainTasks.isNotEmpty) _buildTasks(context),
        _buildTechnologyChips(context),
        _buildFooter(context),
        const SizedBox(height: spacingM),
      ],
    ),
  );

  Widget _buildHeader(BuildContext context) =>
      TitleSubtitleText(title: item.title, subtitle: item.subtitle);

  Widget _buildDescription(BuildContext context) =>
      Text(item.description, style: context.textTheme.bodyLarge);

  Widget _buildTasks(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        LocaleKeys.experience_work_experience_key_responsibilities.tr(),
        style: context.textTheme.labelLarge?.copyWith(
          color: context.colorScheme.primary,
        ),
      ),
      const SizedBox(height: spacingS),
      ...item.mainTasks.map((task) => _buildTaskItem(task, context)),
    ],
  );

  Widget _buildTaskItem(String task, BuildContext context) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: spacingXS),
        child: Icon(
          Icons.circle,
          size: iconSizeS / 2,
          color: context.colorScheme.primary,
        ),
      ),
      const SizedBox(width: spacingS),
      Expanded(child: Text(task, style: context.textTheme.bodyLarge)),
    ],
  );

  Widget _buildFooter(BuildContext context) => Text(
    "${item.location} • ${item.size}",
    style: context.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w700),
  );

  // Store Links Section
  Widget _buildStoreLinks(BuildContext context) {
    bool hasGooglePlay = item.googlePlayUrl?.isNotEmpty ?? false;
    bool hasAppStore = item.appStoreUrl?.isNotEmpty ?? false;
    bool hasWebsite = item.websiteUrl?.isNotEmpty ?? false;

    if (!hasGooglePlay && !hasAppStore && !hasWebsite) {
      return const SizedBox.shrink();
    }

    return Wrap(
      spacing: spacingM,
      runSpacing: spacingS,
      children: [
        if (hasGooglePlay)
          _buildStoreButton(
            context,
            icon: Icons.android,
            text: LocaleKeys.experience_work_experience_store_links_google_play,
            url: item.googlePlayUrl!,
          ),
        if (hasAppStore)
          _buildStoreButton(
            context,
            icon: Icons.apple,
            text: LocaleKeys.experience_work_experience_store_links_app_store,
            url: item.appStoreUrl!,
          ),
        if (hasWebsite)
          _buildStoreButton(
            context,
            icon: Icons.language,
            text: LocaleKeys.experience_work_experience_store_links_website,
            url: item.websiteUrl!,
          ),
      ],
    );
  }

  Widget _buildStoreButton(
    BuildContext context, {
    required IconData icon,
    required String text,
    required String url,
  }) => OutlinedButton.icon(
    onPressed: () => launchUrl(Uri.parse(url)),
    icon: Icon(icon, size: 20, color: context.colorScheme.primary),
    label: Text(
      text.tr(),
      style: context.textTheme.labelMedium?.copyWith(
        color: context.colorScheme.primary,
      ),
    ),
    style: OutlinedButton.styleFrom(
      foregroundColor: context.colorScheme.primary,
      side: BorderSide(color: context.colorScheme.primary),
      padding: const EdgeInsets.symmetric(
        horizontal: spacingM,
        vertical: spacingXS,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
  );

  // Technology Chips Section
  Widget _buildTechnologyChips(BuildContext context) => Wrap(
    spacing: spacingS,
    runSpacing: spacingS,
    children:
        item.technologies.map((tech) => _buildTechChip(context, tech)).toList(),
  );

  Widget _buildTechChip(BuildContext context, String tech) => Chip(
    avatar: FutureBuilder(
      future: TechIcons.getIcon(
        tech,
        size: 20,
        color: context.textTheme.labelMedium?.color,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return snapshot.data!;
        }
        return const SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(strokeWidth: 2),
        );
      },
    ),
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    label: Text(tech, style: context.textTheme.labelMedium),
    backgroundColor: context.colorScheme.primaryContainer,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    padding: const EdgeInsets.symmetric(horizontal: spacingXXS),
  );
}
