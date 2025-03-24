import 'package:portfolio/domain/models/personal_info.dart';
import 'package:portfolio/domain/repositories/personal_info_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'personal_info_view_model.g.dart';

@riverpod
class PersonalInfoState extends _$PersonalInfoState {
  @override
  Future<PersonalInfo> build() async {
    try {
      final repository = ref.read(personalInfoRepositoryProvider);
      return await repository.getPersonalInfo();
    } catch (e, stackTrace) {
      throw AsyncError('Failed to load personal info: $e', stackTrace);
    }
  }
}
