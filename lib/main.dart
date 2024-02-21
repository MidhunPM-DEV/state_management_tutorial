import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_tutorial/features/contacts/view/page/contact_page.dart';
import 'package:state_management_tutorial/features/todo/controller/todo_notifier.dart';
import 'package:state_management_tutorial/features/todo/controller/todo_provider.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return TodoProvider(
      todoNotifier: TodoNotifier(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(
          useMaterial3: true,
        ),
        home: ConctactPage(),
      ),
    );
  }
}
