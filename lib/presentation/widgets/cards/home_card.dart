import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key, this.color, this.child, this.elevation = 0.0});

  final Color? color;
  final Widget? child;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      borderRadius: AppValues.lg.ext.radius.border.all,
      color: color ?? Colors.transparent,
      child: Padding(padding: AppValues.lg.ext.padding.all, child: child),
    );
  }
}
