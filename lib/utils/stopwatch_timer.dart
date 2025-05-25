import 'package:flutter/foundation.dart';

class StopwatchTimer {
  StopwatchTimer._internal();
  static final StopwatchTimer _instance = StopwatchTimer._internal();
  factory StopwatchTimer() => _instance;

  final Map<String, Stopwatch> _timers = {};

  void start(String label) {
    if (_timers.containsKey(label)) {
      debugPrint('⚠️ [$label] is already running.');
      return;
    }
    final stopwatch = Stopwatch()..start();
    _timers[label] = stopwatch;
    debugPrint('⏱️ [$label] started...');
  }

  void stop(String label) {
    final stopwatch = _timers[label];
    if (stopwatch == null) {
      debugPrint('❌ [$label] was not started.');
      return;
    }
    stopwatch.stop();
    final time = stopwatch.elapsed;
    debugPrint('✅ [$label] completed in ${time.inMilliseconds} ms '
        '(${time.inMicroseconds} µs)');
    _timers.remove(label);
  }

  Duration? elapsed(String label) => _timers[label]?.elapsed;

  void reset(String label) {
    if (_timers.containsKey(label)) {
      _timers[label]?.reset();
      debugPrint('🔄 [$label] reset.');
    }
  }

  void stopAll() {
    _timers.keys.toList().forEach(stop);
  }
}
