import 'package:flutter/material.dart';

class TypingText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final Duration speed;
  final Duration opacityDuration;

  const TypingText({
    super.key,
    required this.text,
    this.textStyle,
    this.speed = const Duration(milliseconds: 200),
    this.opacityDuration = const Duration(milliseconds: 500),
  });

  @override
  Widget build(BuildContext context) {
    final words = text.split(' ');

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: textStyle,
        children: [
          for (int i = 0; i < words.length; i++)
            WidgetSpan(
              child: FadeInWord(
                word: words[i],
                textStyle: textStyle,
                delay: speed * i,
                duration: opacityDuration,
              ),
            ),
        ],
      ),
    );
  }
}

class FadeInWord extends StatefulWidget {
  final String word;
  final TextStyle? textStyle;
  final Duration delay;
  final Duration duration;

  const FadeInWord({
    super.key,
    required this.word,
    this.textStyle,
    required this.delay,
    required this.duration,
  });

  @override
  FadeInWordState createState() => FadeInWordState();
}

class FadeInWordState extends State<FadeInWord>
    with SingleTickerProviderStateMixin {
  late final AnimationController _opacityController = AnimationController(
    duration: widget.duration,
    vsync: this,
  )..forward(from: 0.0);

  late final Animation<double> _opacityAnimation = Tween<double>(
    begin: 0.0,
    end: 1.0,
  ).animate(
    CurvedAnimation(parent: _opacityController, curve: Curves.easeInOut),
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(widget.delay),
      builder: (_, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Opacity(
            opacity: 0.0,
            child: Text('${widget.word} ', style: widget.textStyle),
          );
        }
        return FadeTransition(
          opacity: _opacityAnimation,
          child: Text('${widget.word} ', style: widget.textStyle),
        );
      },
    );
  }

  @override
  void dispose() {
    _opacityController.dispose();
    super.dispose();
  }
}
