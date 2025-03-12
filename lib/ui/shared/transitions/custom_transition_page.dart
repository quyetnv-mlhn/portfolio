// lib/ui/shared/transitions/app_transition_page.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Page<dynamic> buildCustomTransitionPage({
  required GoRouterState state,
  required Widget child,
  required Color backgroundColor,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final customCurve = CurveTween(curve: Curves.easeOutQuint);

      // Slide animation from bottom with custom curve
      final slideTween = Tween<Offset>(
        begin: const Offset(0, 0.08), // Even more subtle slide
        end: Offset.zero,
      ).chain(customCurve);

      // Fade-in animation starting from 0.5 instead of 0
      final fadeTween = Tween<double>(begin: 0.5, end: 1.0).chain(customCurve);

      return Container(
        color: backgroundColor,
        child: FadeTransition(
          opacity: animation.drive(fadeTween),
          child: SlideTransition(
            position: animation.drive(slideTween),
            child: child,
          ),
        ),
      );
    },
    transitionDuration: const Duration(
      milliseconds: 2000,
    ), // Increased to 2 seconds
    maintainState: false,
    opaque: true,
  );
}
