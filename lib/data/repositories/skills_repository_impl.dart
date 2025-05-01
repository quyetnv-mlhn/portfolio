import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:portfolio/core/enums/locale_enum.dart';
import 'package:portfolio/domain/models/skills/skill_category.dart';
import 'package:portfolio/domain/repositories/skills_repository.dart';
import 'package:portfolio/gen/assets.gen.dart';

class SkillsRepositoryImpl implements SkillsRepository {
  @override
  Future<SkillCategoryResponse> getSkills(LocaleEnum locale) async {
    String path;
    switch (locale) {
      case LocaleEnum.vi:
        path = Assets.data.skills.skillsVi;
        break;
      case LocaleEnum.en:
        path = Assets.data.skills.skillsEn;
        break;
    }
    final jsonString = await rootBundle.loadString(path);
    final json = jsonDecode(jsonString) as Map<String, dynamic>;
    return SkillCategoryResponse.fromJson(json);
  }
}
