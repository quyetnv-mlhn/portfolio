import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/data/repositories/work_experience_repository_impl.dart';
import 'package:portfolio/domain/models/experience/experience_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'work_experience_repository.g.dart';

@Riverpod(keepAlive: true)
WorkExperienceRepository workExperienceRepository(Ref ref) {
  return WorkExperienceRepositoryImpl();
}

abstract class WorkExperienceRepository {
  Future<ExperienceData> getWorkExperience(String languageCode);
}
