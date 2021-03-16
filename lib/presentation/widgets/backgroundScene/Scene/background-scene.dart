import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/presentation/widgets/backgroundScene/Cloud/cloud.dart';
import 'package:weather_app/presentation/widgets/backgroundScene/Hill/hill.dart';
import 'package:weather_app/presentation/widgets/backgroundScene/Sky/sky.dart';

class BackgroundScene extends StatefulWidget {
  @override
  _BackgroundSceneState createState() => _BackgroundSceneState();
}

class _BackgroundSceneState extends State<BackgroundScene>
    with SingleTickerProviderStateMixin {
  final int animationDuration = 1000;
  AnimationController _controller;
  Animation<double> leftAnimation;
  Animation<double> topAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: animationDuration));
    leftAnimation = Tween<double>(begin: -150, end: 150).animate(_controller);
    topAnimation = Tween<double>(begin: 150, end: 100).animate(_controller);
    _controller.forward();
  }

  List<Widget> generateClouds(BuildContext context) {
    List<Widget> clouds = [];

    Random random = new Random();

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    int count = random.nextInt(5) + 4;

    List<int> positions = [];

    for (var i = 0; i < count; i++) {
      positions.add(i);
    }

    for (var i = 0; i < count; i++) {
      double scale = random.nextDouble() + 0.5;
      int rand = random.nextInt(positions.length);

      int y = positions[rand];

      positions.removeAt(rand);

      clouds.add(Cloud(
        index: i,
        left: (width - 80) / count * y + 20,
        top: height / 2 / count * (i + 1),
        scale: scale,
        screenWidth: width,
      ));
    }

    return clouds;
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: Sky(color: Colors.blue),
      child: CustomPaint(
        painter: Hill(offset: 0.2),
        child: Container(
          alignment: Alignment.center,
          child: Stack(
            children: [
              AnimatedBuilder(
                animation: _controller,
                builder: (ctx, child) {
                  return Positioned(
                    left: leftAnimation.value,
                    top: topAnimation.value,
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
              ),
              ...generateClouds(context),
            ],
          ),
        ),
      ),
    );
  }
}
