import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '/model/core_state.dart';

class StateInheritedNotifier extends InheritedNotifier<CoreNotifier> {
  const StateInheritedNotifier({
    super.key,
    required super.child,
    required super.notifier,
  });

  static CoreNotifier of(BuildContext context) {
    final stateInheritedNotifier =
        context.dependOnInheritedWidgetOfExactType<StateInheritedNotifier>();

    if (stateInheritedNotifier == null) {
      throw Exception("No StateInheritedNotifier found in context");
    }

    final notifier = stateInheritedNotifier.notifier;

    if (notifier == null) {
      throw Exception("No CoreNotifier found in CoreNotifier");
    }

    return notifier;
  }

  // no need to override as it is already implemented in super
  // @override
  // bool updateShouldNotify(StateInheritedNotifier oldWidget) =>
  //     oldWidget.notifier != notifier;
}
