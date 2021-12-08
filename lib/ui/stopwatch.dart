import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stopwatch_flutter/ui/elapsed_time_text.dart';

class Stopwatch extends StatefulWidget {
  @override
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch>
    with SingleTickerProviderStateMixin {
  late DateTime _initialTime;
  Duration _elapsed = Duration.zero;
  late final Ticker _ticker;

  @override
  void dispose() {
    super.dispose();
    _ticker.dispose();
  }

  @override
  void initState() {
    super.initState();
    _initialTime = DateTime.now();
    _ticker=this.createTicker((elapsed) {
      final now = DateTime.now();
      setState(() {
        _elapsed = now.difference(_initialTime);
      });
    });
    _ticker.start();
  }

  @override
  Widget build(BuildContext context) {
    return ElapsedTimeText(
      elapsed: _elapsed,
    );
  }
}
