import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/configs/app_sizes.dart';
import 'package:portfolio/gen/assets.gen.dart';

class SpeechBubbleWidget extends StatelessWidget {
  final String imagePath;
  final List<String> textLines;
  final int index;

  const SpeechBubbleWidget({
    super.key,
    required this.textLines,
    required this.index,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 400),
      builder: (context, value, child) {
        return Transform.scale(scale: value, child: child);
      },
      child: Column(
        key: ValueKey(index),
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                Assets.images.speechBubble.path,
                width: 200,
                fit: BoxFit.fitWidth,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: spacingXXS,
                  bottom: spacingL,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children:
                      textLines.map((line) {
                        return AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: Text(
                            line.tr(),
                            key: ValueKey('$index-$line'),
                            style: theme.textTheme.bodyLarge?.copyWith(
                              height: 1.4,
                              fontSize: 14,
                              letterSpacing: 0.1,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      }).toList(),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: CircleAvatar(
              radius: 35,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(imagePath),
            ),
          ),
        ],
      ),
    );
  }
}
