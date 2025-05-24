part of '../ultimate_extension.dart';

enum LogLevel {
  debug("💬", "\x1B[37m"), // White
  info("ℹ️", "\x1B[36m"), // Cyan
  warning("⚠️", "\x1B[33m"), // Yellow
  error("❌", "\x1B[31m"); // Red

  final String emoji;
  final String colorCode;

  const LogLevel(this.emoji, this.colorCode);
}

extension ObjectExtension on Object? {
  bool get isNull {
    return this == null;
  }

  bool get isNotNull {
    return this != null;
  }

  int get getMemoryAddress {
    return identityHashCode(this);
  }

  Type get whatsMydataType {
    return runtimeType;
  }

  /// Convert to build in data types
  /// double data = "12344.5".tryConvertTo();
  T tryConvertTo<T>() {
    try {
      return this as T;
    } catch (e) {
      // Handle type casting failure by converting to the desired type if possible
      if (T == String) {
        return toString() as T;
      } else if (T == int) {
        return int.tryParse(toString()) as T;
      } else if (T == double) {
        return double.tryParse(toString()) as T;
      } else if (T == bool) {
        return (toString().toLowerCase() == 'true') as T;
      } else {
        throw UnsupportedError('Cannot cast $this to $T');
      }
    }
  }

  @Deprecated("Use .log() directly instead with  level Log.error")
  logError() {
    UltimateLogger().logError(this);
  }

  @Deprecated("Use .log() directly instead with  level Log.info")
  logSuccess() {
    UltimateLogger().logSuccess(this);
  }

  @Deprecated("Use .log() directly instead with  level Log.warning")
  logWarning() {
    UltimateLogger().logWarning(this);
  }

  void log({
    String tag = "APP",
    LogLevel level = LogLevel.debug,
    bool enableColors = true,
    bool showCallerInfo = false,
  }) {
    final now = DateTime.now().toIso8601String();

    final color = (enableColors && _supportsAnsiColors) ? level.colorCode : '';
    final reset = (enableColors && _supportsAnsiColors) ? "\x1B[0m" : '';

    final callerInfo = showCallerInfo ? _getCallerInfo() : '';
    final callerSection = callerInfo.isNotEmpty ? " $callerInfo" : '';

    final message = "${level.emoji} [$tag:$callerSection] $now $this";
    debugPrint("$color$message$reset");
  }

  bool get _supportsAnsiColors =>
      !Platform.isWindows || stdout.supportsAnsiEscapes;

  String _getCallerInfo() {
    try {
      final line = StackTrace.current.toString().split("\n")[2].trim();
      final match = RegExp(r'\((.+?):(\d+):\d+\)$').firstMatch(line);
      if (match != null) {
        final file =
            match.group(1)?.split(Platform.pathSeparator).last ?? 'unknown';
        final lineNum = match.group(2) ?? '0';
        return "$file:$lineNum";
      }
    } catch (_) {}
    return '';
  }
}
