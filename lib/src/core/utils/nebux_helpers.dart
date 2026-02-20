import 'dart:async';
import 'dart:ui';

/// A generic class to hold a pair of values of potentially different types.
class NebuxDynamicPair<A, B> {
  /// The first value in the pair.
  final A aValue;

  /// The second value in the pair.
  final B bValue;

  /// Constructor for [NebuxDynamicPair].
  NebuxDynamicPair({required this.aValue, required this.bValue});

  /// Creates a copy of this [NebuxDynamicPair] but with the given fields replaced with the new values.
  NebuxDynamicPair<A, B> copyWith({A? aValue, B? bValue}) {
    return NebuxDynamicPair<A, B>(
      aValue: aValue ?? this.aValue,
      bValue: bValue ?? this.bValue,
    );
  }

  @override
  String toString() => 'NebuxDynamicPair(aValue: $aValue, bValue: $bValue)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NebuxDynamicPair<A, B> &&
          runtimeType == other.runtimeType &&
          aValue == other.aValue &&
          bValue == other.bValue;

  @override
  int get hashCode => aValue.hashCode ^ bValue.hashCode;
}

/// A debouncer utility that delays the execution of a function until a specified duration has passed since the last call.
class NebuxDebouncer {
  /// The delay duration in milliseconds before the action fires.
  final int milliseconds;
  Timer? _timer;
  VoidCallback? _onDebounce;

  /// Optional callback that is called when the debounced action fires.
  set onDebounce(VoidCallback? callback) => _onDebounce = callback;

  /// Creates a debouncer with the given delay in [milliseconds].
  NebuxDebouncer({required this.milliseconds});

  /// Runs the provided [action] after [milliseconds] have passed since the last call.
  /// If called again before the duration, the timer resets.
  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), () {
      action();
      _onDebounce?.call();
    });
  }

  /// Cancels the current timer if active.
  void cancel() => _timer?.cancel();

  /// Returns true if the debouncer is currently waiting to fire.
  bool get isActive => _timer?.isActive ?? false;

  /// Disposes the debouncer and cleans up resources.
  void dispose() {
    _timer?.cancel();
    _timer = null;
    _onDebounce = null;
  }
}
