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