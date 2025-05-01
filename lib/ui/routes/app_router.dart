import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/ui/shared/transitions/custom_transition_page.dart';
import 'package:portfolio/ui/views/about_me/views/about_me_screen.dart';
import 'package:portfolio/ui/views/base_screen/views/base_screen.dart';
import 'package:portfolio/ui/views/experience/views/experience_screen.dart';
import 'package:portfolio/ui/views/home/view/home_screen.dart';
import 'package:portfolio/ui/views/skills/views/skills_screen.dart';

class AppRouter {
  static const String home = '/';
  static const String aboutMe = '/about-me';
  static const String mySkills = '/my-skills';
  static const String experiences = '/experiences';
  static const String lifetime = '/lifetime';
  static const String contact = '/contact';

  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>();

  static final router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    initialLocation: home,
    routes: <RouteBase>[
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return BaseScreen(child: child);
        },
        routes: [
          GoRoute(
            path: home,
            pageBuilder:
                (context, state) => buildCustomTransitionPage(
                  state: state,
                  child: HomeScreen(),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                ),
          ),
          GoRoute(
            path: aboutMe,
            pageBuilder:
                (context, state) => buildCustomTransitionPage(
                  state: state,
                  child: AboutMeScreen(),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                ),
          ),
          GoRoute(
            path: mySkills,
            pageBuilder:
                (context, state) => buildCustomTransitionPage(
                  state: state,
                  child: SkillsScreen(),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                ),
          ),
          GoRoute(
            path: experiences,
            pageBuilder:
                (context, state) => buildCustomTransitionPage(
                  state: state,
                  child: ExperienceScreen(),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                ),
          ),
          GoRoute(
            path: lifetime,
            pageBuilder:
                (context, state) => buildCustomTransitionPage(
                  state: state,
                  child: Center(child: Text('Lifetime Screen')),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                ),
          ),
          GoRoute(
            path: contact,
            pageBuilder:
                (context, state) => buildCustomTransitionPage(
                  state: state,
                  child: Center(child: Text('Contact Screen')),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                ),
          ),
        ],
      ),
    ],
  );
}
