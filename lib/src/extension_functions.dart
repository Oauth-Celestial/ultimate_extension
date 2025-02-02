part of '../ultimate_extension.dart';

extension FutureExtensions<T> on Future<T> {
  Future<T> trackExecutionTime(String label) async {
    final startTime = DateTime.now();
    final result = await this;
    final endTime = DateTime.now();
    final duration = endTime.difference(startTime).inMilliseconds;
    devtools.log('$label took $duration ms');
    return result;
  }
}
