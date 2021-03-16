import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Cloud extends StatefulWidget {
  final double top;
  final double left;
  final double scale;
  final int index;
  final double screenWidth;

  Cloud({this.left, this.top, this.scale, this.index, this.screenWidth});

  @override
  _CloudState createState() => _CloudState();
}

class _CloudState extends State<Cloud> with SingleTickerProviderStateMixin {
  final int animationDuration = 1000;
  AnimationController _controller;
  Animation<double> leftAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: animationDuration));
    leftAnimation = Tween<double>(
            begin: widget.index % 2 == 0
                ? -widget.left
                : widget.left + widget.screenWidth,
            end: widget.left)
        .animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (ctx, child) => Positioned(
        top: widget.top,
        left: leftAnimation.value,
        child: Container(
          child: SvgPicture.asset(
            'assets/cloud.svg',
            width: 80 * widget.scale,
            height: 60 * widget.scale,
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ),
    );
  }
}
