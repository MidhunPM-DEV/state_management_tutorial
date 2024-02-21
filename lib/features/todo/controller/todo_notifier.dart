import 'package:flutter/material.dart';
import 'package:state_management_tutorial/features/todo/model/todo_model.dart';

class TodoNotifier extends ChangeNotifier {
  final _todoList = <TodoModel>[];

  List<TodoModel> get todoList {
    return _todoList;
  }

  void addTask(String task) {
    _todoList.add(
      TodoModel(title: task, isComplete: false),
    );
    notifyListeners();
  }

  void updateTask(TodoModel task, int index) {
    _todoList[index] = task;
    notifyListeners();
  }

  void deleteTask(int index) {
    _todoList.removeAt(index);
    notifyListeners();
  }
}
