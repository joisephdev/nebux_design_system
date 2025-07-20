extension IterableExtensions<T> on Iterable<T> {
  Iterable<R> mapIndexed<R>(R Function(T element, int index) f) sync* {
    var index = 0;
    for (final element in this) {
      yield f(element, index++);
    }
  }
}
