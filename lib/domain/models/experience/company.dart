import 'package:portfolio/domain/models/experience/timeline_item.dart';

class Company {
  final String period;
  final String name;
  final String position;
  final String logo;
  final List<TimelineItem> projects;

  Company({
    required this.period,
    required this.name,
    required this.position,
    required this.logo,
    required this.projects,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      period: json['period'] as String,
      name: json['name'] as String,
      position: json['position'] as String,
      logo: json['logo'] as String,
      projects:
          (json['projects'] as List)
              .map((item) => TimelineItem.fromJson(item))
              .toList(),
    );
  }
}
