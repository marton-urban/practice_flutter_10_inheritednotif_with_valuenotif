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
    // shorter version:
    // return context
    //     .dependOnInheritedWidgetOfExactType<StateInheritedNotifier>()!
    //     .notifier!;

    final stateInheritedNotifier =
        context.dependOnInheritedWidgetOfExactType<StateInheritedNotifier>();

    if (stateInheritedNotifier == null) {
      throw Exception("No StateInheritedNotifier found in context");
    }

    final localNotifier = stateInheritedNotifier.notifier;

    if (localNotifier == null) {
      throw Exception("No CoreNotifier found in CoreNotifier");
    }

    return localNotifier;
  }

  // no need to override as it is already implemented in super
  // and is NOT used in this example anyway, because
  // notifier (which is a CoreNotifier object) itself is never renewed,
  // only its value field is changed (which is a CoreState object)
  // so oldWidget.notifier == notifier in this example at all times
  // @override
  // bool updateShouldNotify(StateInheritedNotifier oldWidget) =>
  //     oldWidget.notifier != notifier;
}
