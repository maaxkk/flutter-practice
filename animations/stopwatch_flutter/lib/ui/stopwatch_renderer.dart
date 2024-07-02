import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stopwatch_flutter/ui/clock_hand.dart';
import 'package:stopwatch_flutter/ui/clock_markers.dart';
import 'package:stopwatch_flutter/ui/elapsed_time_text.dart';

class StopwatchRenderer extends StatelessWidget {
  const StopwatchRenderer({
    super.key,
    required this.elapsed,
    required this.radius,
  });

  final double radius;
  final Duration elapsed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (var i = 0; i < 60; i++)
          Positioned(
              top: radius,
              left: radius,
              child: ClockMarkers(seconds: i, radius: radius)),
        for (var i = 5; i <= 60; i += 5)
          Positioned(
              top: radius,
              left: radius,
              child: ClockTextMarker(maxValue: 60, value: i, radius: radius)),
        Container(
          decoration: BoxDecoration(
            // border: Border.all(color: Colors.orange),
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        Positioned(
          left: radius,
          top: radius,
          child: ClockHand(
            rotationZAngle: pi + (2 * pi / 60000) * elapsed.inMilliseconds,
            handThickness: 2,
            handLength: radius,
            color: Colors.orange,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: radius * 1.3,
          child: ElapsedTimeText(elapsed: elapsed),
        ),
      ],
    );
  }
}
