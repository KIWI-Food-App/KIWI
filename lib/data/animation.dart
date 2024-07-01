import 'dart:math';
import 'package:flutter/material.dart';
import 'package:start_folder_to_zip/data/styles.dart';

class CirclePainter extends CustomPainter {
  final double percentage;

  CirclePainter(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = kiwiGreen
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    double radius = min(size.width, size.height) / 2;
    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, paint);

    Paint progressPaint = Paint()
      ..color = greyButton
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    double arcAngle = 2 * pi * (1 - percentage);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, progressPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}