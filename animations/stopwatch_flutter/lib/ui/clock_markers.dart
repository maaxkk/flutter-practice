import 'dart:math';

import 'package:flutter/material.dart';

class ClockMarkers extends StatelessWidget {
  const ClockMarkers({super.key, required this.seconds, required this.radius});

  final int seconds;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final color = seconds % 5 == 0 ? Colors.white : Colors.grey[700];
    const width = 2.0;
    const height = 12.0;
    return Transform(
      transform: Matrix4.identity()
        ..translate(-width / 2, -height / 2, 0.0)
        ..rotateZ(2 * pi * (seconds / 60.0))
        ..translate(0.0, radius - height / 2, 0.0),
      alignment: Alignment.center,
      child: Container(width: width, height: height, color: color),
    );
  }
}

class ClockTextMarker extends StatelessWidget {
  const ClockTextMarker(
      {super.key,
      required this.value,
      required this.maxValue,
      required this.radius});

  final int value;
  final int maxValue;
  final double radius;

  @override
  Widget build(BuildContext context) {
    const width = 40.0;
    const height = 30.0;
    return Transform(
      transform: Matrix4.identity()
        ..translate(-width / 2, -height / 2, 0.0)
        ..rotateZ(pi + 2 * pi * (value / maxValue))
        ..translate(0.0, radius - height, 0.0)
        ..rotateZ(pi - 2 * pi * (value / maxValue)),
      alignment: Alignment.center,
      child: SizedBox(
        width: width,
        height: height,
        child: Text(
          '$value',
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
