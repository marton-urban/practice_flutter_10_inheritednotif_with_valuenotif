// Single Source of Truth
// Whether you use ChangeNotifier or ValueNotifier, this approach is about having a single source of truth.
// With ValueNotifier, the data is immutable, so it can’t be modified by definition.
// Data can only change for either by using the functions defined within.

import 'package:flutter/material.dart';

class CoreState {
  const CoreState({this.counter = 0, this.backgroundColor = Colors.green});

  final int counter;
  final Color backgroundColor;

  CoreState copyWith({
    final int? counter,
    final Color? backgroundColor,
  }) {
    return CoreState(
      counter: counter ?? this.counter,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  // this is not needed, because value setter in CoreNotifier uses == to check
  // whether notifyListeners() is needed and apparently it can see the diff
  // @override
  // bool operator ==(covariant CoreState other) =>
  //     identical(this, other) ||
  //     runtimeType == other.runtimeType &&
  //         counter == other.counter &&
  //         backgroundColor == other.backgroundColor;

  // @override
  // int get hashCode => counter.hashCode ^ backgroundColor.hashCode;
}

class CoreNotifier extends ValueNotifier<CoreState> {
  CoreNotifier(super.value);

  void incrementCounter() {
    value = value.copyWith(counter: value.counter + 1);
  }

  void setColor(Color newBackgroundColor) {
    value = value.copyWith(backgroundColor: newBackgroundColor);
  }

  void setCounter(int newCounter) {
    value = value.copyWith(counter: newCounter);
  }
}
