import 'package:flutter/material.dart';
import 'package:portfolio/core/extensions/responsive_extension.dart';

class CustomLoading extends StatefulWidget {
  /// The size of the loading widget, defaults to full screen if not provided
  final Size? size;

  const CustomLoading({super.key, this.size});

  @override
  State<CustomLoading> createState() => _CustomLoadingState();
}

class _CustomLoadingState extends State<CustomLoading>
    with TickerProviderStateMixin {
  static const _rotationDuration = Duration(milliseconds: 1200);
  static const _pulseDuration = Duration(milliseconds: 1000);
  static const _pulseBegin = 0.8;
  static const _pulseEnd = 1.0;
  static const _pi2 = 2 * 3.14159;

  static const _largeCircleSize = 100.0;
  static const _mediumCircleSize = 80.0;
  static const _mobileIconSize = 24.0;
  static const _desktopIconSize = 32.0;

  static const _mobileScale = 1.8;
  static const _desktopScale = 2.2;
  static const _mobileMediumScale = 1.3;
  static const _desktopMediumScale = 1.6;

  late final AnimationController _rotationController;
  late final AnimationController _pulseController;
  late final Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
  }

  void _setupAnimations() {
    _rotationController = AnimationController(
      vsync: this,
      duration: _rotationDuration,
    )..repeat();

    _pulseController = AnimationController(
      vsync: this,
      duration: _pulseDuration,
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: _pulseBegin, end: _pulseEnd).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  Widget _buildPulseCircle({
    required double size,
    required double scale,
    required List<Color> gradientColors,
    required List<double> gradientStops,
  }) {
    return AnimatedBuilder(
      animation: _pulseAnimation,
      builder:
          (context, _) => Transform.scale(
            scale: _pulseAnimation.value * scale,
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: gradientColors,
                  stops: gradientStops,
                ),
              ),
            ),
          ),
    );
  }

  Widget _buildRotatingCircle(bool isMobile, ThemeData theme) {
    final size = isMobile ? _mediumCircleSize * 0.75 : _mediumCircleSize;

    return AnimatedBuilder(
      animation: _rotationController,
      builder:
          (context, _) => Transform.rotate(
            angle: _rotationController.value * _pi2,
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: SweepGradient(
                  colors: [
                    theme.colorScheme.primary,
                    theme.colorScheme.secondary,
                    theme.colorScheme.primary.withValues(alpha: 0.4),
                    theme.colorScheme.surfaceContainerHighest.withValues(
                      alpha: 0.2,
                    ),
                  ],
                  stops: const [0.0, 0.4, 0.8, 1.0],
                ),
                boxShadow: [
                  BoxShadow(
                    color: theme.colorScheme.primary.withValues(alpha: 0.3),
                    blurRadius: 12,
                    spreadRadius: 2,
                  ),
                ],
              ),
            ),
          ),
    );
  }

  Widget _buildPulsingIcon(bool isMobile, ThemeData theme) {
    return AnimatedBuilder(
      animation: _pulseAnimation,
      builder:
          (context, _) => Transform.scale(
            scale: _pulseAnimation.value,
            child: Icon(
              Icons.hourglass_empty,
              size: isMobile ? _mobileIconSize : _desktopIconSize,
              color: theme.colorScheme.onSurface,
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = context.isMobile;
    final effectiveSize = widget.size ?? MediaQuery.of(context).size;

    return SizedBox(
      width: effectiveSize.width,
      height: effectiveSize.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _buildPulseCircle(
            size: _largeCircleSize,
            scale: isMobile ? _mobileScale : _desktopScale,
            gradientColors: [
              theme.colorScheme.primary.withValues(alpha: 0.15),
              theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.05),
              Colors.transparent,
            ],
            gradientStops: const [0.0, 0.7, 1.0],
          ),
          _buildPulseCircle(
            size: _mediumCircleSize,
            scale: isMobile ? _mobileMediumScale : _desktopMediumScale,
            gradientColors: [
              theme.colorScheme.secondary.withValues(alpha: 0.25),
              theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.1),
              Colors.transparent,
            ],
            gradientStops: const [0.0, 0.6, 1.0],
          ),
          _buildRotatingCircle(isMobile, theme),
          _buildPulsingIcon(isMobile, theme),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _pulseController.dispose();
    super.dispose();
  }
}
