import 'dart:developer' as developer;

class UltimateLogger {
  final String _successIcon = "✔"; // Green checkmark
  final String _warningIcon = "⚠"; // Warning sign
  final String _errorIcon = "✖"; // Red cross
  void logError(Object? object) {
    developer.log('$_errorIcon \x1B[31m$object\x1B[0m');
  }

  void logSuccess(Object? object) {
    developer.log('$_successIcon \x1B[32m$object\x1B[0m');
  }

  void logWarning(Object? object) {
    developer.log('$_warningIcon \x1B[33m$object\x1B[0m');
  }
}
