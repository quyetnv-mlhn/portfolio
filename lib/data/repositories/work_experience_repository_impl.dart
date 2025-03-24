import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:portfolio/core/enums/locale_enum.dart';
import 'package:portfolio/domain/models/experience/experience_data.dart';
import 'package:portfolio/domain/repositories/work_experience_repository.dart';
import 'package:portfolio/gen/assets.gen.dart';

class WorkExperienceRepositoryImpl implements WorkExperienceRepository {
  @override
  Future<ExperienceData> getWorkExperience(LocaleEnum locale) async {
    try {
      String assetFile;
      switch (locale) {
        case LocaleEnum.en:
          assetFile = Assets.data.experiences.experienceEn;
          break;
        case LocaleEnum.vi:
          assetFile = Assets.data.experiences.experienceVi;
          break;
      }
      final String jsonString = await rootBundle.loadString(assetFile);
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      return ExperienceData.fromJson(json);
    } catch (e, s) {
      throw Exception('Failed to load work experience data: $e\n$s');
    }
  }
}
