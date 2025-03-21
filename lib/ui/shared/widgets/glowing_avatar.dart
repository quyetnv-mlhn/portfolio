import 'package:flutter/material.dart';
import 'package:portfolio/core/extensions/theme_ext.dart';

class GlowingAvatar extends StatefulWidget {
  final String imagePath;
  final double size;
  final bool withGlowingBorder;

  const GlowingAvatar({
    required this.imagePath,
    this.size = 73,
    this.withGlowingBorder = true,
    super.key,
  });

  @override
  State<GlowingAvatar> createState() => _GlowingAvatarState();
}

class _GlowingAvatarState extends State<GlowingAvatar>
    with SingleTickerProviderStateMixin {
  static const _glowWidth = 2.0;
  static const _borderWidth = 1.0;
  static const _animationDuration = Duration(seconds: 1);
  static const _pi2 = 2 * 3.14159;

  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: _animationDuration, vsync: this)
      ..repeat();
    _animation = Tween<double>(begin: 0, end: _pi2).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildImage() {
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(widget.imagePath),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildGlowingImage(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder:
          (_, child) => Container(
            width: widget.size,
            height: widget.size,
            padding: const EdgeInsets.all(_glowWidth),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: SweepGradient(
                center: Alignment.center,
                colors: [
                  context.colorScheme.primary.withValues(alpha: 0.05),
                  context.colorScheme.primary.withValues(alpha: 0.8),
                  context.colorScheme.primary.withValues(alpha: 0.05),
                ],
                stops: const [0.0, 0.5, 1.0],
                transform: GradientRotation(_animation.value),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.colorScheme.surface,
                border: Border.all(
                  color: context.colorScheme.primary.withValues(alpha: 0.2),
                  width: _borderWidth,
                ),
              ),
              child: ClipOval(
                child: Image.asset(widget.imagePath, fit: BoxFit.contain),
              ),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.withGlowingBorder
        ? _buildGlowingImage(context)
        : _buildImage();
  }
}
