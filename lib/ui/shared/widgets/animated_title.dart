import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AnimatedTitle extends StatefulWidget {
  final String text;
  final TextStyle? textStyle;
  final Duration animationSpeed;
  final Duration initialDelay;
  final String cursor;
  final TextAlign textAlign;
  final bool displayFullTextOnTap;
  final bool stopPauseOnTap;

  const AnimatedTitle({
    super.key,
    required this.text,
    this.textStyle,
    this.animationSpeed = const Duration(milliseconds: 100),
    this.initialDelay = const Duration(milliseconds: 1200),
    this.cursor = '|',
    this.textAlign = TextAlign.center,
    this.displayFullTextOnTap = true,
    this.stopPauseOnTap = true,
  });

  @override
  State<AnimatedTitle> createState() => _AnimatedTitleState();
}

class _AnimatedTitleState extends State<AnimatedTitle> {
  bool _showTitle = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(widget.initialDelay, () {
      if (mounted) {
        setState(() => _showTitle = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_showTitle) {
      return Text(
        widget.cursor,
        style: widget.textStyle,
        textAlign: widget.textAlign,
      );
    }

    return AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText(
          widget.text,
          textStyle: widget.textStyle,
          speed: widget.animationSpeed,
          cursor: widget.cursor,
          textAlign: widget.textAlign,
        ),
      ],
      isRepeatingAnimation: false,
      displayFullTextOnTap: widget.displayFullTextOnTap,
      stopPauseOnTap: widget.stopPauseOnTap,
      repeatForever: false,
    );
  }
}
