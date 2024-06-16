part of '../ultimate_extension.dart';

extension ObjectExtension on Object? {
  bool get isNull {
    return this == null;
  }

  int get getMemoryAddress {
    return identityHashCode(this);
  }

  Type get whatsMydataType {
    return runtimeType;
  }

  void log() => devtools.log(toString());
}
