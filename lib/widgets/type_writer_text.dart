import 'dart:async';

import 'package:flutter/material.dart';

class TypeWriterText extends StatefulWidget {
  final String text;
  final TextStyle? style;

  final Duration typingSpeed;
  final bool useSingleWord;
  final VoidCallback? onAnimationFinished;

  const TypeWriterText({
    super.key,
    required this.text,
    this.style,
    this.typingSpeed = const Duration(milliseconds: 1),
    this.onAnimationFinished,
    this.useSingleWord = false,
  });

  @override
  State<TypeWriterText> createState() => _TypeWriterTextState();
}

class _TypeWriterTextState extends State<TypeWriterText> {
  late StreamController<String> _streamController;
  bool _hasCalledCallback = false;
  int timeTaken = 0;
  DateTime date = DateTime.now();

  @override
  void initState() {
    super.initState();
    _streamController = StreamController<String>();
    _startTypingEffect();
  }

  void _startTypingEffect() async {
    String displayedText = '';
    if (widget.useSingleWord) {
      List<String> wordsList = widget.text.split(" ");
      for (int i = 0; i < wordsList.length; i++) {
        await Future.delayed(widget.typingSpeed);
        timeTaken += widget.typingSpeed.inMilliseconds;
        displayedText += "${wordsList[i]} ";
        _streamController.add(displayedText);
      }
    } else {
      for (int i = 0; i < widget.text.length; i++) {
        await Future.delayed(widget.typingSpeed);
        displayedText += widget.text[i];
        timeTaken += widget.typingSpeed.inMilliseconds;
        _streamController.add(displayedText);
      }
    }

    if (!_hasCalledCallback) {
      _hasCalledCallback = true;

      widget.onAnimationFinished?.call();
    }

    _streamController.close();
  }

  @override
  void dispose() {
    if (!_streamController.isClosed) {
      _streamController.close();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: _streamController.stream,
      initialData: '',
      builder: (context, snapshot) {
        return Text(
          snapshot.data!,
          style: widget.style,
        );
      },
    );
  }
}
