import 'package:flutter/material.dart';

class AnimatedVisibility extends StatefulWidget {
  const AnimatedVisibility({
    required this.child,
    required this.visible,
    required this.duration,
    super.key,
    this.curve = Curves.linear,
  });

  final Widget child;
  final bool visible;
  final Duration duration;
  final Curve curve;

  @override
  _AnimatedVisibilityState createState() => _AnimatedVisibilityState();
}

class _AnimatedVisibilityState extends State<AnimatedVisibility>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Durations.medium4,
      switchInCurve: widget.curve,
      switchOutCurve: widget.curve,
      transitionBuilder: (child, animation) {
        return AnimatedBuilder(
          animation: animation,
          builder: (_, __) {
            return Opacity(
              opacity: animation.value,
              child: Transform.scale(
                scaleY: animation.value,
                scaleX: 1,
                alignment: Alignment.bottomCenter,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  heightFactor: animation.value,
                  child: child,
                ),
              ),
            );
          },
        );
      },
      child: widget.visible ? widget.child : const SizedBox.shrink(),
    );
  }
}
