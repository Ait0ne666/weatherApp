import 'package:flutter/material.dart';
import 'package:weather_app/presentation/widgets/backgroundScene/Hill/hill.dart';
import 'package:weather_app/presentation/widgets/backgroundScene/Scene/scene.dart';
import 'package:weather_app/presentation/widgets/backgroundScene/Sky/sky.dart';
import 'package:weather_app/presentation/widgets/backgroundScene/Sun/sun.dart';

class DayColors {
  final Color startColor;
  final Color endColor;
  final Color hillStartColor;
  final Color hillEndColor;

  DayColors(
      {this.startColor, this.endColor, this.hillEndColor, this.hillStartColor});
}

var dayColors = DayColors(
    startColor: Colors.blue,
    endColor: Colors.blue.withAlpha(40),
    hillStartColor: Color.fromRGBO(91, 124, 53, 1),
    hillEndColor: Colors.lightGreen);

var nightColors = DayColors(
    startColor: Color(0xff13131d),
    endColor: Color(0xff26263a),
    hillStartColor: Color.fromRGBO(108, 153, 55, 1),
    hillEndColor: Color.fromRGBO(74, 105, 37, 1));

var dawnColors = DayColors(
    startColor: Color(0xff4a4969),
    endColor: Color(0xffeab0d1),
    hillStartColor: Color.fromRGBO(108, 153, 55, 1),
    hillEndColor: Color.fromRGBO(74, 105, 37, 1));

class BackgroundScene extends StatefulWidget {
  @override
  _BackgroundSceneState createState() => _BackgroundSceneState();
}

class _BackgroundSceneState extends State<BackgroundScene>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Scene scene = new Scene(
        context: context,
        currentTime: DateTime.now().add(Duration(minutes: 420)),
        dawn: DateTime.now().subtract(Duration(hours: 4)),
        dusk: DateTime.now().add(Duration(hours: 8)));
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var colors = scene.generateColors();
    // print(colors.startColor);
    // print(colors.endColor);

    return CustomPaint(
      painter: Sky(startColor: colors.startColor, endColor: colors.endColor),
      child: Container(
        alignment: Alignment.center,
        child: Stack(
          children: [
            Sun(scene.generateSunPosition()),
            ...scene.generateClouds(),
            Positioned(
                top: 0,
                left: 0,
                child: CustomPaint(
                    painter: Hill(
                        offset: 0.2,
                        startColor: colors.hillStartColor,
                        endColor: colors.hillEndColor),
                    child: Container(width: width, height: height)))
          ],
        ),
      ),
    );
  }
}
