import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/enums/locale_enum.dart';
import 'package:portfolio/data/repositories/skills_repository_impl.dart';
import 'package:portfolio/domain/models/skills/skill_category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'skills_repository.g.dart';

@Riverpod(keepAlive: true)
SkillsRepository skillsRepository(Ref ref) {
  return SkillsRepositoryImpl();
}

abstract class SkillsRepository {
  Future<SkillCategoryResponse> getSkills(LocaleEnum locale);
}
