import 'package:flutter/material.dart';
import 'package:state_management_tutorial/features/todo/controller/todo_notifier.dart';

class TodoProvider extends InheritedWidget {
  final TodoNotifier todoNotifier;
  const TodoProvider({
    super.key,
    required this.todoNotifier,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return todoNotifier != (oldWidget as TodoProvider).todoNotifier;
  }

  static TodoProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TodoProvider>()!;
  }
}


// 