import 'package:portfolio/domain/models/home/home_data.dart';
import 'package:portfolio/domain/repositories/home_repository.dart';
import 'package:portfolio/ui/views/base_screen/view_models/language_view_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  int _currentIndex = 0;

  @override
  Future<(HomeData, int)> build() async {
    final repository = ref.read(homeRepositoryProvider);
    final locale = ref.watch(languageStateProvider);
    final homeData = await repository.getHomeData(locale);
    return (homeData, _currentIndex);
  }

  void setCurrentIndex(int index) {
    state.whenData((value) {
      _currentIndex = index;
      state = AsyncData((value.$1, index));
    });
  }

  List<SlideData> get slides => state.valueOrNull?.$1.slides ?? [];
  String get avatarPath => state.valueOrNull?.$1.avatarPath ?? '';
  int get currentIndex => state.valueOrNull?.$2 ?? 0;
}
