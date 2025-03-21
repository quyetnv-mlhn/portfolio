import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:portfolio/domain/models/experience/experience_data.dart';
import 'package:portfolio/domain/repositories/work_experience_repository.dart';

class WorkExperienceRepositoryImpl implements WorkExperienceRepository {
  @override
  Future<ExperienceData> getWorkExperience(String languageCode) async {
    try {
      final String jsonString = await rootBundle.loadString(
        'assets/data/experience_$languageCode.json',
      );
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      return ExperienceData.fromJson(json);
    } catch (e, s) {
      throw Exception('Failed to load work experience data: $e\n$s');
    }
  }
}
