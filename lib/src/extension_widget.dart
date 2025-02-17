part of '../ultimate_extension.dart';

extension SeparatedIterable on Iterable<Widget> {
  /// Allows to insert a [separator] between the items of the iterable.
  List<Widget> separatedBy(Widget separator) {
    final result = <Widget>[];
    final iterator = this.iterator;
    if (iterator.moveNext()) {
      result.add(iterator.current);
      while (iterator.moveNext()) {
        result
          ..add(separator)
          ..add(iterator.current);
      }
    }
    return result;
  }
}

extension ExtensionWidget on Widget {
  Widget shimmer(
      {required bool isLoading,
      AlignmentGeometry? begin,
      AlignmentGeometry? end}) {
    return isLoading
        ? ShimmerWidget(
            begin: begin,
            end: end,
            child: this,
          )
        : this;
  }
}
