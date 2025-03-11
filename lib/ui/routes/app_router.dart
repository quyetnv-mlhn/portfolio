import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/ui/views/about_me/views/about_me_screen.dart';
import 'package:portfolio/ui/views/base_screen/views/base_screen.dart';
import 'package:portfolio/ui/views/experience/views/experience_screen.dart';
import 'package:portfolio/ui/views/home/view/home_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  // Route names
  static const String home = '/';
  static const String aboutMe = '/about-me';
  static const String myBlogs = '/my-blogs';
  static const String experiences = '/experiences';
  static const String lifetime = '/lifetime';
  static const String contact = '/contact';

  static final router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    initialLocation: home,
    routes: <RouteBase>[
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder:
            (context, state, child) =>
                BaseScreen(key: ValueKey(state.uri.path), child: child),
        routes: [
          GoRoute(
            path: home,
            pageBuilder:
                (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: HomeScreen(key: UniqueKey()),
                ),
          ),
          GoRoute(
            path: aboutMe,
            pageBuilder:
                (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: AboutMeScreen(key: UniqueKey()),
                ),
          ),
          GoRoute(
            path: myBlogs,
            pageBuilder:
                (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: Center(
                    key: UniqueKey(),
                    child: Text('My Blogs Screen'),
                  ),
                ),
          ),
          GoRoute(
            path: experiences,
            pageBuilder:
                (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: ExperienceScreen(key: UniqueKey()),
                ),
          ),
          GoRoute(
            path: lifetime,
            pageBuilder:
                (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: Center(
                    key: UniqueKey(),
                    child: Text('Lifetime Screen'),
                  ),
                ),
          ),
          GoRoute(
            path: contact,
            pageBuilder:
                (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: Center(
                    key: UniqueKey(),
                    child: Text('Contact Screen'),
                  ),
                ),
          ),
        ],
      ),
    ],
    observers: [NavigatorObserver()],
  );
}
