class EducationModel {
  final String major;
  final String university;
  final String period;
  final String location;
  final String image;

  EducationModel({
    required this.major,
    required this.university,
    required this.period,
    required this.location,
    required this.image,
  });

  factory EducationModel.fromJson(Map<String, dynamic> json) {
    return EducationModel(
      major: json['major'] as String,
      university: json['university'] as String,
      period: json['period'] as String,
      location: json['location'] as String,
      image: json['image'] as String,
    );
  }
}
