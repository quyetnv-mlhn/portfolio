import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/configs/app_sizes.dart';
import 'package:portfolio/core/extensions/theme_ext.dart';

class SnackBarHandler {
  static final SnackBarHandler _instance = SnackBarHandler._internal();

  factory SnackBarHandler() => _instance;

  SnackBarHandler._internal();

  static GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;

  static void showSnackBar({
    required String message,
    required IconData icon,
    required Color backgroundColor,
    String? title,
    Color textColor = Colors.white,
    Duration duration = const Duration(seconds: 3),
    EdgeInsets? margin,
    EdgeInsets? padding,
    bool isDismissible = true,
    DismissDirection dismissDirection = DismissDirection.vertical,
    VoidCallback? onTap,
    String? actionLabel,
  }) {
    BuildContext? context = scaffoldMessengerKey?.currentContext;
    if (scaffoldMessengerKey?.currentState == null || context == null) {
      return;
    }

    scaffoldMessengerKey?.currentState?.clearSnackBars();

    final snackBar = SnackBar(
      content: AnimatedSnackBarContent(
        message: message,
        icon: icon,
        backgroundColor: backgroundColor,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      duration: duration,
      behavior: SnackBarBehavior.floating,
      dismissDirection: dismissDirection,
      margin: margin ?? const EdgeInsets.all(spacingXXS),
      padding: padding ?? const EdgeInsets.all(spacingXS),
      action:
          onTap != null
              ? SnackBarAction(
                label: actionLabel ?? 'OK'.tr(),
                backgroundColor: backgroundColor,
                onPressed: onTap,
                textColor: Colors.white,
              )
              : null,
    );

    scaffoldMessengerKey?.currentState?.showSnackBar(snackBar);
  }

  static void showError(String? message, {String? title}) {
    showSnackBar(
      title: title,
      message: message ?? 'Something went wrong'.tr(),
      backgroundColor: Colors.red,
      icon: Icons.error_outline,
    );
  }

  static void showSuccess(
    String? message, {
    String? title,
    VoidCallback? onTap,
    String? actionLabel,
  }) {
    showSnackBar(
      title: title,
      message: message ?? 'Something went wrong'.tr(),
      backgroundColor: Colors.green,
      icon: Icons.check_circle_outline,
      onTap: onTap,
      actionLabel: actionLabel,
    );
  }

  static void showInfo(String message, {String? title}) {
    showSnackBar(
      title: title,
      message: message,
      backgroundColor: Colors.blue,
      icon: Icons.info_outline,
    );
  }

  static void showWarning(String message, {String? title}) {
    showSnackBar(
      title: title,
      message: message,
      backgroundColor: Colors.orange,
      icon: Icons.warning_amber_rounded,
    );
  }
}

// A custom widget to handle the sliding animation for the SnackBar's content
class AnimatedSnackBarContent extends StatefulWidget {
  final String message;
  final Color backgroundColor;
  final IconData icon;

  const AnimatedSnackBarContent({
    required this.message,
    required this.backgroundColor,
    required this.icon,
    super.key,
  });

  @override
  AnimatedSnackBarContentState createState() => AnimatedSnackBarContentState();
}

class AnimatedSnackBarContentState extends State<AnimatedSnackBarContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    // Set up the animation controller for entry and exit animations
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 300),
    );

    // Create the slide animation
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, -1.0), // Starts above the screen
      end: Offset.zero, // Ends at the final position (visible)
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    // Play the forward animation (show the SnackBar)
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Container(
        padding: const EdgeInsets.all(spacingM),
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(radiusM),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(widget.icon, color: Colors.white, size: iconSizeXS),
            horizontalSpaceS,
            Expanded(
              child: Text(
                widget.message,
                style: context.textTheme.titleSmall?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
