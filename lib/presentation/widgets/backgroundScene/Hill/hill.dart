import 'dart:math';

import 'package:flutter/material.dart';

class Hill extends CustomPainter {
  final double offset;
  final Color startColor;
  final Color endColor;

  Hill({this.offset, this.startColor, this.endColor});

  @override
  bool shouldRepaint(Hill oldDelegate) => true;

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Path path2 = Path();
    Path path3 = Path();

    Paint paint = Paint();
    final w = size.width;
    final h = size.height;

    paint.color = Colors.red;

    var gradient = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [endColor, startColor],
        stops: [0, 0.2]);

    var gradient2 = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [endColor, startColor],
        stops: [0, 0.2]);

    path.lineTo(0, h * offset);
    path.quadraticBezierTo(w / 2 + 100, h * offset - 20, w, h * offset);
    path.lineTo(w, 0);

    path2.lineTo(0, h * (offset + 0.05));
    path2.cubicTo(
        w * 0.2, h * offset + 60, w * 0.8, h * offset - 20, w, h * offset + 20);
    path2.lineTo(w, h * (offset));

    path3.lineTo(0, h * (offset + 0.05));
    path3.cubicTo(
        w * 0.2, h * offset, w * 0.6, h * offset + 80, w, h * (offset + 0.1));
    path3.lineTo(w, h * (offset));

    canvas.translate(w, h);
    canvas.rotate(pi);
    canvas.drawPath(
        path3,
        Paint()
          ..shader = gradient
              .createShader(Offset.zero & Size(w, h * (1 + 2 * offset))));
    canvas.drawPath(
        path2,
        Paint()
          ..shader =
              gradient.createShader(Offset.zero & Size(w, h * (1 + offset))));
    canvas.drawPath(
        path, Paint()..shader = gradient.createShader(Offset.zero & size));
  }
}
