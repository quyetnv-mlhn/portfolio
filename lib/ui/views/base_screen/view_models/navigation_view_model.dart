import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/enums/navigation_section_enum.dart';
import 'package:portfolio/ui/routes/app_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'navigation_view_model.g.dart';

@Riverpod(keepAlive: true)
class NavigationState extends _$NavigationState {
  static const _navigationKey = 'selected_navigation';
  SharedPreferences? _prefs;

  Future<SharedPreferences> get _preferences async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }

  @override
  NavigationSection build() {
    _restoreState();
    return NavigationSection.home;
  }

  Future<void> _restoreState() async {
    final prefs = await _preferences;
    final savedIndex = prefs.getInt(_navigationKey);
    if (savedIndex != null && savedIndex < NavigationSection.values.length) {
      state = NavigationSection.values[savedIndex];
    }
  }

  Future<void> selectSection(
    NavigationSection section,
    BuildContext context,
  ) async {
    if (section == state) return;

    state = section;

    // Save state
    final prefs = await _preferences;
    await prefs.setInt(_navigationKey, section.index);

    if (!context.mounted) return;

    final path = switch (section) {
      NavigationSection.home => AppRouter.home,
      NavigationSection.aboutMe => AppRouter.aboutMe,
      NavigationSection.myBlogs => AppRouter.myBlogs,
      NavigationSection.experiences => AppRouter.experiences,
      NavigationSection.lifetime => AppRouter.lifetime,
      NavigationSection.contact => AppRouter.contact,
    };

    context.go(path);
  }
}
