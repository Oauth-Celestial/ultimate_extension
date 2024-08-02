part of '../ultimate_extension.dart';

class UltimateExtension {
  final Map<String, Timer> _debounceTimers = {};
  final Map<String, bool> _throttleReadiness = {};
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
    _debounceTimers[id]?.cancel();
    // Set a new timer for this ID
    _debounceTimers[id] = Timer(delay, action);
  }

  // Cancel debouncer by ID
  void cancelDebounce({required String id}) {
    // Cancel the timer associated with this ID
    _debounceTimers[id]?.cancel();
    // Remove the timer from the map
    _debounceTimers.remove(id);
  }

  // Cancel all debouncers
  void cancelAllDebounce() {
    // Cancel all timers
    for (var timer in _debounceTimers.values) {
      timer.cancel();
    }
    // Clear the map
    _debounceTimers.clear();
  }

  // Throttle method
  void throttle(
      {required String id,
      required Duration delay,
      required VoidCallback action}) {
    if (_throttleReadiness[id] == true) return;

    _throttleReadiness[id] = true;
    action();
    Future.delayed(delay, () => _throttleReadiness[id] = false);
  }

  // Cancel throttler by ID
  void cancelThrottle({required String id}) {
    // Simply remove the ID from the readiness map
    _throttleReadiness.remove(id);
  }

  // Cancel all throttlers
  void cancelAllThrottle() {
    // Clear the readiness map
    _throttleReadiness.clear();
  }
}
