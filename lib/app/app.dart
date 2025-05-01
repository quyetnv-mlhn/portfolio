import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/enums/theme_mode_enum.dart';
import 'package:portfolio/core/utils/snackbar_handler.dart';
import 'package:portfolio/domain/repositories/about_me_repository.dart';
import 'package:portfolio/domain/repositories/home_repository.dart';
import 'package:portfolio/domain/repositories/personal_info_repository.dart';
import 'package:portfolio/domain/repositories/work_experience_repository.dart';
import 'package:portfolio/ui/routes/app_router.dart';
import 'package:portfolio/ui/shared/themes/app_themes.dart';
import 'package:portfolio/ui/views/about_me/view_models/about_me_view_model.dart';
import 'package:portfolio/ui/views/base_screen/view_models/personal_info_view_model.dart';
import 'package:portfolio/ui/views/base_screen/view_models/theme_mode_view_model.dart';
import 'package:portfolio/ui/views/experience/view_models/experience_view_model.dart';
import 'package:portfolio/ui/views/home/view_model/home_view_model.dart';
import 'package:portfolio/ui/views/skills/view_models/skills_view_model.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeModeStateProvider);

    return _EagerInitialization(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: SnackBarHandler.scaffoldMessengerKey,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode: currentTheme.themeMode,
        routerConfig: AppRouter.router,
      ),
    );
  }
}

class _EagerInitialization extends ConsumerWidget {
  final Widget child;

  const _EagerInitialization({required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _initData(ref);
    return child;
  }

  void _initData(WidgetRef ref) {
    ref.watch(homeRepositoryProvider);
    ref.watch(personalInfoRepositoryProvider);
    ref.watch(aboutMeRepositoryProvider);
    ref.watch(workExperienceRepositoryProvider);

    ref.watch(personalInfoStateProvider);
    ref.watch(homeViewModelProvider);
    ref.watch(aboutMeStateProvider);
    ref.watch(experienceViewModelProvider);
    ref.watch(skillsViewModelProvider);
  }
}
