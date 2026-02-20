import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

void main() {
  group('NebuxDynamicPair', () {
    test('stores two values of different types', () {
      final pair = NebuxDynamicPair<String, int>(aValue: 'hello', bValue: 42);

      expect(pair.aValue, equals('hello'));
      expect(pair.bValue, equals(42));
    });

    test('copyWith replaces aValue', () {
      final pair = NebuxDynamicPair<String, int>(aValue: 'hello', bValue: 42);
      final updated = pair.copyWith(aValue: 'world');

      expect(updated.aValue, equals('world'));
      expect(updated.bValue, equals(42));
    });

    test('copyWith replaces bValue', () {
      final pair = NebuxDynamicPair<String, int>(aValue: 'hello', bValue: 42);
      final updated = pair.copyWith(bValue: 99);

      expect(updated.aValue, equals('hello'));
      expect(updated.bValue, equals(99));
    });

    test('copyWith with no args returns equivalent pair', () {
      final pair = NebuxDynamicPair<String, int>(aValue: 'hello', bValue: 42);
      final copy = pair.copyWith();

      expect(copy, equals(pair));
    });

    test('toString includes both values', () {
      final pair = NebuxDynamicPair<String, int>(aValue: 'hello', bValue: 42);

      expect(pair.toString(), contains('hello'));
      expect(pair.toString(), contains('42'));
    });

    test('equality works for identical values', () {
      final a = NebuxDynamicPair<String, int>(aValue: 'hello', bValue: 42);
      final b = NebuxDynamicPair<String, int>(aValue: 'hello', bValue: 42);

      expect(a, equals(b));
      expect(a.hashCode, equals(b.hashCode));
    });

    test('inequality for different values', () {
      final a = NebuxDynamicPair<String, int>(aValue: 'hello', bValue: 42);
      final b = NebuxDynamicPair<String, int>(aValue: 'world', bValue: 42);

      expect(a, isNot(equals(b)));
    });
  });

  group('NebuxDebouncer', () {
    test('runs action after delay', () async {
      final debouncer = NebuxDebouncer(milliseconds: 50);
      final completer = Completer<void>();

      debouncer.run(() => completer.complete());

      expect(completer.isCompleted, isFalse);

      await completer.future;

      expect(completer.isCompleted, isTrue);

      debouncer.dispose();
    });

    test('cancel stops pending action', () async {
      final debouncer = NebuxDebouncer(milliseconds: 50);
      var callCount = 0;

      debouncer.run(() => callCount++);
      debouncer.cancel();

      await Future<void>.delayed(const Duration(milliseconds: 100));

      expect(callCount, equals(0));

      debouncer.dispose();
    });

    test('isActive returns true while timer is pending', () {
      final debouncer = NebuxDebouncer(milliseconds: 500);

      expect(debouncer.isActive, isFalse);

      debouncer.run(() {});

      expect(debouncer.isActive, isTrue);

      debouncer.cancel();
      debouncer.dispose();
    });

    test('isActive returns false after cancel', () {
      final debouncer = NebuxDebouncer(milliseconds: 500);

      debouncer.run(() {});
      debouncer.cancel();

      expect(debouncer.isActive, isFalse);

      debouncer.dispose();
    });

    test('onDebounce callback is called when action fires', () async {
      final debouncer = NebuxDebouncer(milliseconds: 50);
      final actionCompleter = Completer<void>();
      var debounceCalled = false;

      debouncer.onDebounce = () => debounceCalled = true;
      debouncer.run(() => actionCompleter.complete());

      await actionCompleter.future;

      expect(debounceCalled, isTrue);

      debouncer.dispose();
    });

    test('dispose cleans up and makes isActive false', () {
      final debouncer = NebuxDebouncer(milliseconds: 500);

      debouncer.run(() {});
      debouncer.dispose();

      expect(debouncer.isActive, isFalse);
    });

    test('repeated calls reset the timer', () async {
      final debouncer = NebuxDebouncer(milliseconds: 100);
      var callCount = 0;

      debouncer.run(() => callCount++);

      await Future<void>.delayed(const Duration(milliseconds: 50));

      // Reset by calling again
      debouncer.run(() => callCount++);

      await Future<void>.delayed(const Duration(milliseconds: 50));

      // First timer would have fired by now if not reset
      expect(callCount, equals(0));

      // Wait for second timer
      await Future<void>.delayed(const Duration(milliseconds: 60));

      expect(callCount, equals(1));

      debouncer.dispose();
    });

    test('milliseconds field is accessible', () {
      final debouncer = NebuxDebouncer(milliseconds: 250);

      expect(debouncer.milliseconds, equals(250));

      debouncer.dispose();
    });
  });
}
