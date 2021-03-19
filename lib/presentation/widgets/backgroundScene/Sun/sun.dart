import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Sun extends StatefulWidget {
  final Point sunPosition;

  Sun(this.sunPosition);

  @override
  _SunState createState() => _SunState();
}

class _SunState extends State<Sun> with SingleTickerProviderStateMixin {
  final int animationDuration = 1000;
  AnimationController _controller;
  Animation<double> leftAnimation;
  Animation<double> bottomAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: animationDuration));
    leftAnimation =
        Tween<double>(begin: -150, end: widget.sunPosition.x.toDouble())
            .animate(_controller);
    bottomAnimation =
        Tween<double>(begin: 0, end: widget.sunPosition.y.toDouble())
            .animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (ctx, child) {
        return Positioned(
          left: leftAnimation.value,
          bottom: bottomAnimation.value,
          child: Container(
            child: SvgPicture.asset(
              'assets/sun.svg',
              width: 160,
              height: 160,
              color: Colors.yellow,
            ),
          ),
        );
      },
    );
  }
}
