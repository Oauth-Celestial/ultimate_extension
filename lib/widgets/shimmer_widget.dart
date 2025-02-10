import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ShimmerWidget extends StatefulWidget {
  final Widget child;
  final AlignmentGeometry? begin;
  final AlignmentGeometry? end;
  final List<Color>? shimmerColors;
  final bool isTransparent; // New flag for transparency

  ShimmerWidget({
    super.key,
    required this.child,
    this.begin,
    this.end,
    this.shimmerColors,
    this.isTransparent = false, // Default to false (no transparency)
  });

  @override
  ShimmerWidgetState createState() => ShimmerWidgetState();
}

class ShimmerWidgetState extends State<ShimmerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  List<double> calculateStops(int colorCount, double progress) {
    if (colorCount < 2) return [0.0, 1.0]; // Ensure at least two stops

    double step = 0.6 / (colorCount - 1); // Adjust step based on range
    return List.generate(
      colorCount,
      (index) => (progress - 0.3) + (index * step),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            final gradient = LinearGradient(
              begin: widget.begin ?? Alignment.topLeft,
              end: widget.end ?? Alignment.bottomRight,
              colors: widget.shimmerColors ??
                  [
                    Colors.grey.shade300
                        .withValues(alpha: widget.isTransparent ? 0.6 : 1.0),
                    Colors.grey.shade100
                        .withValues(alpha: widget.isTransparent ? 0.3 : 1.0),
                    Colors.grey.shade300
                        .withValues(alpha: widget.isTransparent ? 0.6 : 1.0),
                  ],
              stops: calculateStops(
                  widget.shimmerColors?.length ?? 3, _controller.value),
            );
            return gradient.createShader(bounds);
          },
          blendMode: widget.isTransparent ? BlendMode.dstIn : BlendMode.srcATop,
          child: widget.child,
        );
      },
      child: widget.child,
    );
  }
}
