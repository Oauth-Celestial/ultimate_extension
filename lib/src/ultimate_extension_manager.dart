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
    // Cancel any existing timer for this ID
    _debouncers[id]?.cancel();
    // Set a new timer for this ID
    _debouncers[id] = Timer(delay, action);
  }

  // Cancel debouncer by ID
  void cancelDebounce({required String id}) {
    // Cancel the timer associated with this ID
    _debouncers[id]?.cancel();
    // Remove the timer from the map
    _debouncers.remove(id);
  }

  // Cancel all debouncers
  void cancelAllDebounce() {
    // Cancel all timers
    for (var timer in _debouncers.values) {
      timer.cancel();
    }
    // Clear the map
    _debouncers.clear();
  }

  // Throttle method
  void throttle(
      {required String id,
      required Duration delay,
      required VoidCallback action}) {
    if (_throttles[id]?.shouldWait == true) {
      _throttles[id]?.action = action;
      return;
    }

    timeFunction() {
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

  // Cancel throttler by ID
  void cancelThrottle({required String id}) {
    // Simply remove the ID from the readiness map
    _throttles.remove(id);
  }

  // Cancel all throttlers
  void cancelAllThrottle() {
    // Clear the readiness map
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
