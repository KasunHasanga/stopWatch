import 'dart:math';

import 'package:flutter/material.dart';

class ClockSecondsTickMarker extends StatelessWidget {
  const ClockSecondsTickMarker(
      {Key? key, required this.radius, required this.seconds})
      : super(key: key);
  final int seconds;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final color = seconds % 5 == 0 ? Colors.white : Colors.grey[700];
    const width = 2.0;
    const height = 12.0;
    return Transform(
      transform: Matrix4.identity()
        ..translate(-width / 2, height / 2, 0.0)
        ..rotateZ(2 * pi * (seconds / 60.0))
        ..translate(0.0, radius - height / 2, 0.0),
      alignment: Alignment.center,
      child: Container(
        width: width,
        height: height,
        color: color,
      ),
    );
  }
}
