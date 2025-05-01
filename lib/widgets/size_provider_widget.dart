import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show SchedulerBinding;

class SizeProviderWidget extends StatefulWidget {
  /// The child widget whose size will be monitored.
  final Widget child;

  /// The callback function that will be called when the size changes.
  final Function(Size) onChange;

  const SizeProviderWidget(
      {required this.onChange, required this.child, super.key});

  @override
  State<SizeProviderWidget> createState() => _SizeProviderWidgetState();
}

class _SizeProviderWidgetState extends State<SizeProviderWidget> {
  final sizeKey = GlobalKey();

  Size? oldSize;

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback(postFrameCallback);
    return SizedBox(
      key: sizeKey,
      child: widget.child,
    );
  }

  void postFrameCallback(_) {
    var context = sizeKey.currentContext;
    if (context == null) return;

    var newSize = context.size;
    if (oldSize == newSize || newSize == null) return;

    oldSize = newSize;
    widget.onChange(newSize);
  }
}
