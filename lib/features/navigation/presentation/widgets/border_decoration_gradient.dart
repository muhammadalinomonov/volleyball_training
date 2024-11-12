import 'package:flutter/material.dart';

class CustomGradient extends CustomPainter {
  CustomGradient({required this.gradient, required this.sWidth, required this.bRadius});

  final double bRadius;
  final Gradient gradient;
  final double sWidth;
  final Paint p = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    Rect innerRect = Rect.fromLTRB(sWidth, sWidth, size.width - 1.5, size.height - 1.5);
    Rect outerRect = Offset.zero & size;

    RRect innerRoundedRect = RRect.fromRectAndRadius(innerRect, Radius.circular(bRadius));
    RRect outerRoundedRect = RRect.fromRectAndRadius(outerRect, Radius.circular(bRadius));

    p.shader = gradient.createShader(outerRect);
    Path borderPath = _calculateBorderPath(outerRoundedRect, innerRoundedRect);
    canvas.drawPath(borderPath, p);
  }

  Path _calculateBorderPath(RRect outerRect, RRect innerRect) {
    Path outerRectPath = Path()..addRRect(outerRect);
    Path innerRectPath = Path()..addRRect(innerRect);
    return Path.combine(PathOperation.difference, outerRectPath, innerRectPath);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
