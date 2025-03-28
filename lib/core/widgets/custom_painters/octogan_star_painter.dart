import 'dart:math';

import 'package:flutter/material.dart';

class OctoganStarPainter extends CustomPainter {
  const OctoganStarPainter({
    required this.color,
    this.strokeWidth = 2.0,
    this.radius = 1.0,
    this.range = 1.5,
  });

  final Color color;
  final double strokeWidth;
  final double radius;
  final double range;

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth;

    final path = Path();
    final cx = size.width / 2;
    final cy = size.height / 2;
    final r = size.width / 2;

    final points = <Offset>[];
    for (var i = 1; i < 18; i++) {
      final angle = (i * 22.5) * (pi / 180);
      final radiusCalc = (i.isEven ? r : r / range) * radius;
      points.add(
        Offset(cx + radiusCalc * cos(angle), cy + radiusCalc * sin(angle)),
      );
    }

    path.moveTo(points[0].dx, points[0].dy);
    for (var i = 0; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
