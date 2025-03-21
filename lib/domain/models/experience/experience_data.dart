import 'package:portfolio/domain/models/experience/company.dart';
import 'package:portfolio/domain/models/experience/education.dart';

class ExperienceData {
  final List<String> technicalProfile;
  final List<EducationModel> education;
  final List<Company> companies;

  ExperienceData({
    required this.technicalProfile,
    required this.education,
    required this.companies,
  });

  factory ExperienceData.fromJson(Map<String, dynamic> json) {
    return ExperienceData(
      technicalProfile:
          (json['technical_profile'] as List)
              .map((item) => item as String)
              .toList(),
      education:
          (json['education'] as List)
              .map((item) => EducationModel.fromJson(item))
              .toList(),
      companies:
          (json['companies'] as List)
              .map((item) => Company.fromJson(item))
              .toList(),
    );
  }
}
