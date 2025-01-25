import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:portfolio/core/enums/navigation_section_enum.dart';

part 'navigation_view_model.g.dart';

@riverpod
class NavigationState extends _$NavigationState {
  @override
  NavigationSection build() {
    return NavigationSection.aboutMe;
  }

  void selectSection(NavigationSection section) {
    state = section;
  }
}
