import 'package:portfolio/core/enums/locale_enum.dart';
import 'package:portfolio/domain/repositories/work_experience_repository.dart';
import 'package:portfolio/ui/views/base_screen/view_models/language_view_model.dart';
import 'package:portfolio/ui/views/experience/models/experience_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'experience_view_model.g.dart';

@riverpod
class ExperienceViewModel extends _$ExperienceViewModel {
  @override
  ExperienceState build() {
    state = const ExperienceState();

    ref.listen(languageStateProvider, (_, __) {
      _loadWorkExperience();
    });

    _loadWorkExperience();
    return state;
  }

  Future<void> _loadWorkExperience() async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      final repository = ref.read(workExperienceRepositoryProvider);
      final locale = ref.read(languageStateProvider).locale;
      final data = await repository.getWorkExperience(locale.languageCode);

      state = state.copyWith(data: data, isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to load work experience: $e',
      );
    }
  }

  Future<void> refresh() => _loadWorkExperience();
}
