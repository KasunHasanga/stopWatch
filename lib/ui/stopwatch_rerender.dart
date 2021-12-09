import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stopwatch_flutter/ui/clock_hand.dart';
import 'package:stopwatch_flutter/ui/clock_markers.dart';
import 'package:stopwatch_flutter/ui/elapsed_time_text.dart';

class StopWatchRerender extends StatelessWidget {
  const StopWatchRerender(
      {Key? key, required this.elapsed, required this.radius})
      : super(key: key);
  final Duration elapsed;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (var i = 0; i < 60; i++)
          Positioned(
              left: radius,
              top: radius,
              child: ClockSecondsTickMarker(radius: radius, seconds: i)),
        // Container(
        //   decoration: BoxDecoration(
        //       border: Border.all(width: 3, color: Colors.orange),
        //       borderRadius: BorderRadius.circular(radius)),
        // ),
        for (var i = 5; i <= 60; i += 5)
          Positioned(
              left: radius,
              top: radius,
              child: ClockTextMarker(
                radius: radius,
                maxValue: 60,
                value: i,
              )),

        Positioned(
          left: radius,
          top: radius,
          child: ClockHand(
              color: Colors.orange,
              handLength: radius,
              handThickness: 2.0,
              rotationZAngle: pi + (pi * 2 / 60000) * elapsed.inMilliseconds),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: radius * 1.3,
          child: ElapsedTimeText(
            elapsed: elapsed,
          ),
        ),
      ],
    );
  }
}
