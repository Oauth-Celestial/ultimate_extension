part of '../ultimate_extension.dart';

class IndexValue<T> {
  int? itemIndex;
  T? data;

  IndexValue({this.itemIndex, this.data});
}

extension ListExtensions<T> on List<T> {
  T getRandomElement() {
    if (isEmpty) {
      throw StateError("The list is empty");
    }
    final random = Random();
    return this[random.nextInt(length)];
  }

  List<T> shallowCopy() {
    return List.from(this);
  }

  void swap({required int oldIndex, required int newIndex}) {
    if (oldIndex < 0 ||
        oldIndex >= length ||
        newIndex < 0 ||
        newIndex >= length) {
      throw RangeError('Index out of range');
    }
    T temp = this[oldIndex];
    this[oldIndex] = this[newIndex];
    this[newIndex] = temp;
  }
}

extension IteratableExtension<T> on Iterable<T> {
  /// Gets the element present at the provided index
  /// you can also get element by using negative index just like python
  T? getElementAt(int index) {
    if (index >= 0 && index < length) {
      // Positive index
      return elementAt(index);
    } else if (index < 0 && index >= -length) {
      // Negative index
      return elementAt(length + index);
    } else {
      // Out of range index
      return null;
    }
  }

  T get getLastElement {
    if (isEmpty) throw Exception("List Is Empty");

    return last;
  }

  T get getFirstElement {
    if (isEmpty) throw Exception("List Is Empty");

    return first;
  }

  IndexValue<T>? getFirstElementWithIndex(bool Function(T) condition) {
    if (isEmpty) throw Exception("List Is Empty");
    for (var index = 0; index < length; index++) {
      if (condition(toList()[index])) {
        return IndexValue<T>(itemIndex: index, data: toList()[index]);
      }
    }
    return IndexValue<T>(itemIndex: -1, data: null);
  }

  bool containsAll(Iterable<T> elements) {
    for (final e in elements) {
      if (!contains(e)) return false;
    }

    return true;
  }

  String getStringByJoiningWith({String seperator = ","}) {
    return join(seperator);
  }

  /// example:
  /// ["hello","flutter","dart"].indexedForEach((index element) {
  ///    print("$index, $element,");
  ///  });
  /// result:
  /// 0 hello
  /// 1 flutter
  /// 2, dart
  void indexedForEach(void Function(int index, T element) action) {
    var index = 0;
    for (var element in this) {
      action(index++, element);
    }
  }

  T? find(bool Function(T selector) predicate) {
    try {
      return singleWhere(predicate);
    } catch (e) {
      return null;
    }
  }
}

extension NumExtension<T extends num> on Iterable<T> {
  T sum() {
    if (isEmpty) return 0 as T;

    var result = T == int ? 0 : 0.0;

    for (var element in this) {
      result += element;
    }

    return result as T;
  }

  T get getMinimum {
    if (isEmpty) throw Exception("List Is Empty");
    return reduce(min);
  }

  T get getMaximum {
    if (isEmpty) throw Exception("List Is Empty");

    return reduce(max);
  }

  T? get getSecondMin {
    if (length < 2) return null;
    var sortedList = [...this]..sort();
    return sortedList[1];
  }

  T? get getSecondMax {
    if (length < 2) return null;
    var sortedList = [...this]..sort();
    return sortedList[length - 2];
  }
}

extension NullIterable<T> on Iterable<T>? {
  List<T?> removeNull() {
    return isNull ? [] : this!.where((element) => element != null).toList();
  }
}

extension ListExtension<T> on List<T> {
  void updateAtIndex(int index, T newValue) {
    if (index >= 0 && index < length) {
      this[index] = newValue;
    }
  }

  List<List<T>> partition({int ofSize = 1}) {
    List<List<T>> partitions = [];
    for (var i = 0; i < length; i += ofSize) {
      partitions.add(sublist(i, i + ofSize > length ? length : i + ofSize));
    }
    return partitions;
  }

  List<T> removeDuplicates() {
    return toSet().toList();
  }

  Set<T> intersect({required Iterable<T> other}) {
    final set = toSet();
    set.retainAll(other);
    return set;
  }

  /// Returns a set containing all elements that are contained
  /// by this collection and not contained by the specified collection.
  Set<T> subtract({required Iterable<T> other}) {
    final set = toSet();
    set.removeAll(other);
    return set;
  }

  /// Returns a set containing all distinct elements from both collections.
  Set<T> union({required Iterable<T> other}) {
    final set = toSet();
    set.addAll(other);
    return set;
  }

  T pop() {
    if (isEmpty) throw Exception("List Is Empty");

    return removeAt(length - 1);
  }

  List<T> deleteElementAt(int index) {
    if (isEmpty) throw Exception("List Is Empty");

    if (index > length) {
      throw Exception("index out of bounds ");
    } else {
      removeAt(index);
      return this;
    }
  }

  List<T> getSublistFrom({required int startIndex, int? endIndex}) {
    if (isEmpty) throw Exception("List Is Empty");
    return sublist(startIndex, endIndex);
  }
}
