import 'package:flutter/material.dart';

class CustomClipPath extends CustomClipper<Path> {
  final BuildContext context;

  CustomClipPath({required this.context});

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    path.moveTo(size.width * 0.36, 0);
    path.lineTo((size.width - (size.width * 0.31 * 2)), 0);
    var firstStart = Offset(size.width * 0.42, 0);
    var firstEnd = Offset(size.width * 0.43, 9);
    path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
    var secondStart = Offset(size.width * 0.44, 28);
    var secondEnd = Offset(size.width * 0.5, 30);
    path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    var thirdStart = Offset(size.width * 0.55, 30);
    var thirdEnd = Offset(size.width * 0.57, 12);
    path.quadraticBezierTo(thirdStart.dx, thirdStart.dy, thirdEnd.dx, thirdEnd.dy);
    var fourthStart = Offset(size.width * 0.58, 0);
    var fourthEnd = Offset(size.width * 0.39 + (size.width - (size.width * 0.39 * 2)), 0);
    path.quadraticBezierTo(fourthStart.dx, fourthStart.dy, fourthEnd.dx, fourthEnd.dy);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
