import 'package:flutter/material.dart';
import 'dart:math';

class Mountains extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    // Path number 1

    paint.color = Colors.red;
    path = Path();
    path.lineTo(size.width / 5, size.height);
    path.cubicTo(size.width / 5, size.height, size.width / 5, size.height,
        size.width / 5, size.height);
    path.cubicTo(size.width / 5, size.height, size.width * 0.19, size.height,
        size.width * 0.18, size.height);
    path.cubicTo(size.width * 0.16, size.height * 0.98, size.width * 0.16,
        size.height * 0.98, size.width * 0.15, size.height * 0.98);
    path.cubicTo(size.width * 0.12, size.height * 0.98, size.width * 0.12,
        size.height * 0.98, size.width * 0.11, size.height);
    path.cubicTo(size.width * 0.11, size.height, size.width * 0.1, size.height,
        size.width * 0.1, size.height);
    path.cubicTo(size.width * 0.1, size.height, size.width * 0.08, size.height,
        size.width * 0.08, size.height);
    path.cubicTo(size.width * 0.06, size.height, size.width * 0.06, size.height,
        size.width * 0.05, size.height);
    path.cubicTo(size.width * 0.05, size.height, size.width * 0.04, size.height,
        size.width * 0.03, size.height * 0.98);
    path.cubicTo(size.width * 0.02, size.height * 0.97, size.width * 0.02,
        size.height * 0.97, size.width * 0.01, size.height * 0.97);
    path.cubicTo(
        0, size.height * 0.97, 0, size.height * 0.97, 0, size.height * 0.97);
    path.cubicTo(
        0, size.height * 0.97, 0, size.height * 0.75, 0, size.height * 0.48);
    path.cubicTo(0, size.height * 0.48, 0, 0, 0, 0);
    path.cubicTo(0, 0, size.width / 2, 0, size.width / 2, 0);
    path.cubicTo(size.width / 2, 0, size.width, 0, size.width, 0);
    path.cubicTo(size.width, 0, size.width, size.height * 0.39, size.width,
        size.height * 0.39);
    path.cubicTo(size.width, size.height * 0.39, size.width, size.height * 0.78,
        size.width, size.height * 0.78);
    path.cubicTo(size.width, size.height * 0.78, size.width, size.height * 0.78,
        size.width, size.height * 0.78);
    path.cubicTo(size.width, size.height * 0.79, size.width, size.height * 0.79,
        size.width, size.height * 0.79);
    path.cubicTo(size.width * 0.98, size.height * 0.79, size.width * 0.98,
        size.height * 0.79, size.width * 0.97, size.height * 0.79);
    path.cubicTo(size.width * 0.96, size.height * 0.79, size.width * 0.96,
        size.height * 0.8, size.width * 0.95, size.height * 0.81);
    path.cubicTo(size.width * 0.94, size.height * 0.81, size.width * 0.94,
        size.height * 0.82, size.width * 0.93, size.height * 0.82);
    path.cubicTo(size.width * 0.93, size.height * 0.82, size.width * 0.92,
        size.height * 0.83, size.width * 0.92, size.height * 0.83);
    path.cubicTo(size.width * 0.91, size.height * 0.84, size.width * 0.9,
        size.height * 0.84, size.width * 0.89, size.height * 0.84);
    path.cubicTo(size.width * 0.89, size.height * 0.84, size.width * 0.88,
        size.height * 0.84, size.width * 0.88, size.height * 0.85);
    path.cubicTo(size.width * 0.86, size.height * 0.86, size.width * 0.85,
        size.height * 0.86, size.width * 0.85, size.height * 0.87);
    path.cubicTo(size.width * 0.84, size.height * 0.87, size.width * 0.84,
        size.height * 0.87, size.width * 0.83, size.height * 0.87);
    path.cubicTo(size.width * 0.82, size.height * 0.88, size.width * 0.81,
        size.height * 0.88, size.width * 0.81, size.height * 0.89);
    path.cubicTo(size.width * 0.8, size.height * 0.89, size.width * 0.8,
        size.height * 0.9, size.width * 0.79, size.height * 0.91);
    path.cubicTo(size.width * 0.78, size.height * 0.92, size.width * 0.78,
        size.height * 0.93, size.width * 0.77, size.height * 0.93);
    path.cubicTo(size.width * 0.77, size.height * 0.93, size.width * 0.75,
        size.height * 0.94, size.width * 0.75, size.height * 0.94);
    path.cubicTo(size.width * 0.74, size.height * 0.94, size.width * 0.73,
        size.height * 0.94, size.width * 0.72, size.height * 0.93);
    path.cubicTo(size.width * 0.71, size.height * 0.93, size.width * 0.7,
        size.height * 0.92, size.width * 0.69, size.height * 0.92);
    path.cubicTo(size.width * 0.69, size.height * 0.92, size.width * 0.68,
        size.height * 0.92, size.width * 0.68, size.height * 0.92);
    path.cubicTo(size.width * 0.67, size.height * 0.91, size.width * 0.66,
        size.height * 0.91, size.width * 0.66, size.height * 0.91);
    path.cubicTo(size.width * 0.66, size.height * 0.91, size.width * 0.65,
        size.height * 0.91, size.width * 0.65, size.height * 0.91);
    path.cubicTo(size.width * 0.64, size.height * 0.91, size.width * 0.64,
        size.height * 0.91, size.width * 0.63, size.height * 0.91);
    path.cubicTo(size.width * 0.63, size.height * 0.91, size.width * 0.61,
        size.height * 0.9, size.width * 0.6, size.height * 0.89);
    path.cubicTo(size.width * 0.6, size.height * 0.89, size.width * 0.6,
        size.height * 0.89, size.width * 0.6, size.height * 0.89);
    path.cubicTo(size.width * 0.6, size.height * 0.89, size.width * 0.58,
        size.height * 0.89, size.width * 0.58, size.height * 0.89);
    path.cubicTo(size.width * 0.58, size.height * 0.89, size.width * 0.57,
        size.height * 0.89, size.width * 0.57, size.height * 0.89);
    path.cubicTo(size.width * 0.57, size.height * 0.89, size.width * 0.56,
        size.height * 0.89, size.width * 0.55, size.height * 0.89);
    path.cubicTo(size.width * 0.54, size.height * 0.89, size.width * 0.54,
        size.height * 0.89, size.width * 0.53, size.height * 0.89);
    path.cubicTo(size.width * 0.52, size.height * 0.88, size.width * 0.51,
        size.height * 0.88, size.width * 0.49, size.height * 0.87);
    path.cubicTo(size.width * 0.49, size.height * 0.87, size.width * 0.48,
        size.height * 0.86, size.width * 0.48, size.height * 0.86);
    path.cubicTo(size.width * 0.48, size.height * 0.86, size.width * 0.47,
        size.height * 0.86, size.width * 0.47, size.height * 0.86);
    path.cubicTo(size.width * 0.46, size.height * 0.86, size.width * 0.46,
        size.height * 0.86, size.width * 0.45, size.height * 0.86);
    path.cubicTo(size.width * 0.43, size.height * 0.85, size.width * 0.43,
        size.height * 0.85, size.width * 0.4, size.height * 0.85);
    path.cubicTo(size.width * 0.38, size.height * 0.85, size.width * 0.38,
        size.height * 0.85, size.width * 0.37, size.height * 0.86);
    path.cubicTo(size.width * 0.36, size.height * 0.86, size.width * 0.36,
        size.height * 0.86, size.width * 0.35, size.height * 0.87);
    path.cubicTo(size.width * 0.34, size.height * 0.88, size.width * 0.34,
        size.height * 0.88, size.width * 0.32, size.height * 0.88);
    path.cubicTo(size.width * 0.32, size.height * 0.88, size.width * 0.31,
        size.height * 0.89, size.width * 0.3, size.height * 0.89);
    path.cubicTo(size.width * 0.29, size.height * 0.9, size.width * 0.28,
        size.height * 0.92, size.width * 0.27, size.height * 0.94);
    path.cubicTo(size.width / 4, size.height * 0.97, size.width * 0.24,
        size.height, size.width * 0.23, size.height);
    path.cubicTo(size.width * 0.22, size.height, size.width * 0.22, size.height,
        size.width * 0.22, size.height);
    path.cubicTo(size.width / 5, size.height, size.width / 5, size.height,
        size.width / 5, size.height);
    path.cubicTo(size.width / 5, size.height, size.width / 5, size.height,
        size.width / 5, size.height);
    canvas.translate(size.width, 1.5 * size.height);
    canvas.rotate(pi);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
