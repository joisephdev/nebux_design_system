/// Convenience extensions on [Iterable].
extension IterableExtensions<T> on Iterable<T> {
  /// Maps each element along with its index to a new value.
  Iterable<R> mapIndexed<R>(R Function(T element, int index) f) sync* {
    var index = 0;
    for (final element in this) {
      yield f(element, index++);
    }
  }
}
