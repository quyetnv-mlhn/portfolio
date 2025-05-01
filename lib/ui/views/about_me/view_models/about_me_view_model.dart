import 'package:portfolio/core/constants/constants.dart';
import 'package:portfolio/domain/models/about_me/about_me_data.dart';
import 'package:portfolio/domain/repositories/about_me_repository.dart';
import 'package:portfolio/ui/views/base_screen/view_models/language_view_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'about_me_view_model.g.dart';

@riverpod
class AboutMeState extends _$AboutMeState {
  @override
  Future<AboutMeData> build() async {
    try {
      final locale = ref.watch(languageStateProvider);
      final repository = ref.read(aboutMeRepositoryProvider);
      final apiCall = repository.getAboutMeData(locale);
      final minLoadingTime = Future.delayed(Constants.minLoadingTime);
      await Future.wait([apiCall, minLoadingTime]);
      return apiCall;
    } catch (e, stackTrace) {
      throw AsyncError('Failed to load about me data: $e', stackTrace);
    }
  }
}
