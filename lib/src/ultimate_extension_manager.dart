part of '../ultimate_extension.dart';

class UltimateExtension {
  final Map<String, Timer> _debouncers = {};
  final Map<String, ThrottleDataHolder> _throttles = {};
  UltimateExtension._();
  static final UltimateExtension _instance = UltimateExtension._();

  factory UltimateExtension() {
    return _instance;
  }

  // Debounce method
  void debounce(
      {required String id,
      required Duration delay,
      required VoidCallback action}) {
    _debouncers[id]?.cancel();
    _debouncers[id] = Timer(delay, action);
  }

  void cancelDebounce({required String id}) {
    _debouncers[id]?.cancel();
    _debouncers.remove(id);
  }

  void cancelAllDebounce() {
    for (var timer in _debouncers.values) {
      timer.cancel();
    }
    _debouncers.clear();
  }

  void throttle(
      {required String id,
      required Duration delay,
      required VoidCallback action}) {
    if (_throttles[id]?.shouldWait == true) {
      _throttles[id]?.action = action;
      return;
    }

    void timeFunction() {
      if (_throttles[id]?.action == null) {
        _throttles[id]?.shouldWait = false;
      } else {
        _throttles[id]?.action?.call();
        _throttles[id]?.action = null;
        Future.delayed(delay, timeFunction);
      }
    }

    action();
    _throttles[id] = ThrottleDataHolder(shouldWait: true);
    Future.delayed(delay, timeFunction);
  }

  void cancelThrottle({required String id}) {
    _throttles.remove(id);
  }

  void cancelAllThrottle() {
    _throttles.clear();
  }
}

class ThrottleDataHolder {
  bool shouldWait;

  VoidCallback? action;
  ThrottleDataHolder({
    this.shouldWait = false,
    this.action,
  });
}
