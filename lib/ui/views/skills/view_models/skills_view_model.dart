import 'package:portfolio/core/constants/constants.dart';
import 'package:portfolio/domain/models/skills/skill_category.dart';
import 'package:portfolio/domain/repositories/skills_repository.dart';
import 'package:portfolio/ui/views/base_screen/view_models/language_view_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'skills_view_model.g.dart';

@riverpod
class SkillsViewModel extends _$SkillsViewModel {
  @override
  Future<SkillCategoryResponse> build() async {
    try {
      final repository = ref.read(skillsRepositoryProvider);
      final locale = ref.watch(languageStateProvider);
      final apiCall = repository.getSkills(locale);
      final minLoadingTime = Future.delayed(Constants.minLoadingTime);
      await Future.wait([apiCall, minLoadingTime]);
      return apiCall;
    } catch (error, stackTrace) {
      throw AsyncError('Failed to load skills data: $error', stackTrace);
    }
  }
}
