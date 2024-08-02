part of '../ultimate_extension.dart';

extension FutureExtensions on Future<dynamic> {
  Future<T> trackExecutionTime<T>(String label) async {
    final startTime = DateTime.now();
    final result = await this;
    final endTime = DateTime.now();
    final duration = endTime.difference(startTime).inMilliseconds;
    devtools.log('$label took $duration ms');
    return result;
  }
}

extension ThrottleFunction<T> on Function {
  void Function() throttle(Duration delay) {
    bool ready = true;
    return () {
      if (!ready) return;
      ready = false;
      Future.delayed(delay, () => ready = true);
      this();
    };
  }
}

extension DebounceFunction<T> on Function {
  void Function() debounce(Duration delay) {
    Timer? timer;
    return () {
      if (timer?.isActive ?? false) timer?.cancel();
      timer = Timer(delay, () => this());
    };
  }
}
