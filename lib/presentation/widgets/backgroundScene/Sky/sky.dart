import 'package:flutter/material.dart';

class Sky extends CustomPainter {
  final Color startColor;
  final Color endColor;

  Sky({this.startColor, this.endColor});

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;

    var gradient = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [startColor, endColor],
        stops: [0, 1]);

    canvas.drawRect(rect, Paint()..shader = gradient.createShader(rect));
  }

  @override
  bool shouldRepaint(Sky oldDelegate) => true;
}
