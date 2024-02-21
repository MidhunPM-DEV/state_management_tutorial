import 'package:flutter/material.dart';
import 'package:state_management_tutorial/features/todo/controller/todo_notifier.dart';
import 'package:state_management_tutorial/features/todo/controller/todo_provider.dart';
import 'package:state_management_tutorial/features/todo/view/todo_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("Build 1");
    return TodoProvider(
      todoNotifier: TodoNotifier(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: TodoPage(),
      ),
    );
  }
}
