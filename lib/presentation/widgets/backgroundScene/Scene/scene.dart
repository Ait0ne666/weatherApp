import 'dart:math';

import 'package:flutter/material.dart';
import 'package:weather_app/presentation/widgets/backgroundScene/Cloud/cloud.dart';
import 'package:weather_app/presentation/widgets/backgroundScene/Scene/background-scene.dart';

var dayColors = DayColors(
    startColor: Colors.blue,
    endColor: Color.fromRGBO(145, 199, 242, 1),
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
    hillStartColor: Color.fromRGBO(91, 124, 53, 1),
    hillEndColor: Colors.lightGreen);

class Scene {
  BuildContext context;
  double _sunSize = 170;
  DateTime currentTime;
  DateTime dawn;
  DateTime dusk;

  Scene({this.context, this.currentTime, this.dawn, this.dusk});

  Duration get dayLength => dusk.difference(dawn);
  Duration get dayGone => currentTime.difference(dawn);

  double get dayGonePercent => dayGone.inSeconds / dayLength.inSeconds;

  List<Widget> generateClouds() {
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

  Point generateSunPosition() {
    Point sunPosition;
    final sceneWidth = MediaQuery.of(context).size.width;
    final sceneHeight = MediaQuery.of(context).size.height;
    final bottomOffset = 0.3 * sceneHeight;

    final maxY = sceneHeight - 100 - _sunSize;
    final minY = bottomOffset - _sunSize;

    final minX = 0;
    final maxX = sceneWidth / 2;

    if (currentTime.compareTo(dawn) < 0) {
      return Point(minX, minY);
    } else if (currentTime.compareTo(dusk) > 0) {
      return Point(minX, minY);
    } else {
      sunPosition = Point(
          (maxX - minX) *
              (dayGonePercent > 0.5
                  ? (1 - dayGonePercent) * 2
                  : dayGonePercent * 2),
          (maxY - minY) *
                  (dayGonePercent > 0.5
                      ? (1 - dayGonePercent) * 2
                      : dayGonePercent * 2) +
              bottomOffset -
              _sunSize);
      print(sunPosition);
      return sunPosition;
    }
  }

  DayColors generateColors() {
    if (currentTime.compareTo(dawn.subtract(Duration(hours: 1))) < 0 ||
        currentTime.compareTo(dusk.add(Duration(hours: 1))) > 0) {
      return nightColors;
    } else if (currentTime.compareTo(dawn.add(Duration(hours: 1))) > 0 &&
        currentTime.compareTo(dusk.subtract(Duration(hours: 1))) < 0) {
      return dayColors;
    } else {
      Color tempStartColor;
      Color tempEndColor;
      Color tempHillStartColor;
      Color tempHillEndColor;

      if (currentTime.compareTo(dawn) < 0 && currentTime.compareTo(dusk) < 0) {
        print(1);
        var percent = (currentTime.difference(dawn).inSeconds / 3600).abs();
        tempStartColor = _extrapolateBetweenColors(
            dawnColors.startColor, nightColors.startColor, percent);
        tempEndColor = _extrapolateBetweenColors(
            dawnColors.endColor, nightColors.endColor, percent);
        tempHillStartColor = _extrapolateBetweenColors(
            dawnColors.hillStartColor, nightColors.hillStartColor, percent);
        tempHillEndColor = _extrapolateBetweenColors(
            dawnColors.hillEndColor, nightColors.hillEndColor, percent);
      } else if ((currentTime.compareTo(dawn) >= 0 &&
          currentTime.compareTo(dawn.add(Duration(hours: 1))) < 0 &&
          currentTime.compareTo(dusk) < 0)) {
        print(2);
        var percent = (currentTime.difference(dawn).inSeconds / 3600).abs();
        tempStartColor = _extrapolateBetweenColors(
            dawnColors.startColor, dayColors.startColor, percent);
        tempEndColor = _extrapolateBetweenColors(
            dawnColors.endColor, dayColors.endColor, percent);
        tempHillStartColor = _extrapolateBetweenColors(
            dawnColors.hillStartColor, dayColors.hillStartColor, percent);
        tempHillEndColor = _extrapolateBetweenColors(
            dawnColors.hillEndColor, dayColors.hillEndColor, percent);
      } else if (currentTime.compareTo(dawn) > 0 &&
          currentTime.compareTo(dusk) > 0) {
        print(3);
        var percent = (currentTime.difference(dusk).inSeconds / 3600).abs();
        print(currentTime.toString());
        print(dusk.toString());
        tempStartColor = _extrapolateBetweenColors(
            dawnColors.startColor, nightColors.startColor, percent);
        tempEndColor = _extrapolateBetweenColors(
            dawnColors.endColor, nightColors.endColor, percent);
        tempHillStartColor = _extrapolateBetweenColors(
            dawnColors.hillStartColor, nightColors.hillStartColor, percent);
        tempHillEndColor = _extrapolateBetweenColors(
            dawnColors.hillEndColor, nightColors.hillEndColor, percent);
      } else if ((currentTime.compareTo(dawn) > 0 &&
          currentTime.compareTo(dusk) <= 0)) {
        print(4);
        var percent = (currentTime.difference(dusk).inSeconds / 3600).abs();
        print(currentTime.toString());
        print(dusk.toString());
        tempStartColor = _extrapolateBetweenColors(
            dawnColors.startColor, dayColors.startColor, percent);
        tempEndColor = _extrapolateBetweenColors(
            dawnColors.endColor, dayColors.endColor, percent);
        tempHillStartColor = _extrapolateBetweenColors(
            dawnColors.hillStartColor, dayColors.hillStartColor, percent);
        tempHillEndColor = _extrapolateBetweenColors(
            dawnColors.hillEndColor, dayColors.hillEndColor, percent);
      }
      // print(tempStartColor);
      // print(tempEndColor)
      return DayColors(
          startColor: tempStartColor,
          endColor: tempEndColor,
          hillStartColor: tempHillStartColor,
          hillEndColor: tempHillEndColor);
    }
  }

  Color _extrapolateBetweenColors(
      Color startColor, Color endColor, double percent) {
    print('s' + startColor.toString());
    print('e' + endColor.toString());
    print(percent);
    int startRed = startColor.red;
    int startBlue = startColor.blue;
    int startGreen = startColor.green;
    int endRed = endColor.red;
    int endBlue = endColor.blue;
    int endGreen = endColor.green;

    int red;
    int blue;
    int green;

    if (startRed > endRed) {
      red = endRed + ((startRed - endRed) * (1 - percent)).round();
    } else {
      red = startRed + ((endRed - startRed) * percent).round();
    }
    if (startBlue > endBlue) {
      blue = endBlue + ((startBlue - endBlue) * (1 - percent)).round();
    } else {
      blue = startBlue + ((endBlue - startBlue) * percent).round();
    }

    if (startGreen > endGreen) {
      green = endGreen + ((startGreen - endGreen) * (1 - percent)).round();
    } else {
      green = startGreen + ((endGreen - startGreen) * percent).round();
    }
    print('f' + Color.fromRGBO(red, green, blue, 1).toString());
    return Color.fromRGBO(red, green, blue, 1);
  }
}
