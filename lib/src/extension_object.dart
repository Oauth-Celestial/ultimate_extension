part of '../ultimate_extension.dart';

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

  logError() {
    UltimateLogger().logError(this);
  }

  logSuccess() {
    UltimateLogger().logSuccess(this);
  }

  logWarning() {
    UltimateLogger().logWarning(this);
  }
}
