class TimelineItem {
  final String period;
  final String title;
  final String subtitle;
  final String description;
  final List<String> technologies;
  final List<String> mainTasks;
  final String location;
  final String size;
  final String? googlePlayUrl;
  final String? appStoreUrl;
  final String? websiteUrl;

  TimelineItem({
    required this.period,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.technologies,
    this.mainTasks = const [],
    required this.location,
    required this.size,
    this.googlePlayUrl,
    this.appStoreUrl,
    this.websiteUrl,
  });

  factory TimelineItem.fromJson(Map<String, dynamic> json) {
    return TimelineItem(
      period: json['period'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      description: json['description'] as String,
      technologies: List<String>.from(json['technologies']),
      mainTasks: List<String>.from(json['main_tasks'] ?? []),
      location: json['location'] as String,
      size: json['size'] as String,
      googlePlayUrl: json['google_play_url'] as String?,
      appStoreUrl: json['app_store_url'] as String?,
      websiteUrl: json['website_url'] as String?,
    );
  }
}
