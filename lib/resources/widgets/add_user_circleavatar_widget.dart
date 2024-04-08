import 'dart:math';

import 'package:flutter/material.dart';

class HalfDisc extends StatelessWidget {
  const HalfDisc({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(145, 50),
      painter: HalfDiscPainter(),
    );
  }
}

class HalfDiscPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black.withOpacity(0.4)
      ..style = PaintingStyle.fill;

    final double radius = size.height / 1.7;
    final double centerX = size.width / 1.5;

    canvas.drawArc(
      Rect.fromCircle(center: Offset(centerX, radius), radius: radius),
      0,
      pi,
      true,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
