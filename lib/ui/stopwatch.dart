import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stopwatch_flutter/ui/elapsed_time_text.dart';
import 'package:stopwatch_flutter/ui/stopwatch_rerender.dart';

class Stopwatch extends StatefulWidget {
  @override
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch>
    with SingleTickerProviderStateMixin {
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
    _ticker=this.createTicker((elapsed) {
      setState(() {
        _elapsed =elapsed;
      });
    });
    _ticker.start();
  }

  @override
  Widget build(BuildContext context) {
    return StopWatchRerender(elapsed: _elapsed);
  }
}
