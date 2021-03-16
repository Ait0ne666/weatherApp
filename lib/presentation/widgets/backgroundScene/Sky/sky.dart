import 'package:flutter/material.dart';

class Sky extends CustomPainter {
  final Color color;

  Sky({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;

    var gradient = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [color, color.withAlpha(40)],
        stops: [0, 1]);

    canvas.drawRect(rect, Paint()..shader = gradient.createShader(rect));
  }

  @override
  bool shouldRepaint(Sky oldDelegate) => true;
}
