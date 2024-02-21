import 'package:flutter/material.dart';
import 'package:state_management_tutorial/core/utils/todo/dialogue_utils.dart';
import 'package:state_management_tutorial/features/todo/controller/todo_provider.dart';
import 'package:state_management_tutorial/features/todo/model/todo_model.dart';

class TodoPage extends StatelessWidget {
  TodoPage({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todoNotifier = TodoProvider.of(context).todoNotifier;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todos"),
        actions: [
          IconButton(
            onPressed: () {
              TodoDialogUtil.showTodoDialog(
                context,
                controller,
                onPressed: () {
                  todoNotifier.addTask(controller.text);
                  controller.clear();
                  Navigator.pop(context);
                },
              );
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: ListenableBuilder(
          listenable: TodoProvider.of(context).todoNotifier,
          builder: (context, child) {
            final todoList = TodoProvider.of(context).todoNotifier.todoList;
            return todoList.isEmpty
                ? const Center(
                    child: Text("Empty todo"),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    itemCount: todoList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        clipBehavior: Clip.antiAlias,
                        child: ListTile(
                          leading: Checkbox(
                            value: todoList[index].isComplete,
                            onChanged: (value) {
                              todoNotifier.updateTask(
                                  TodoModel(
                                      title: todoList[index].title,
                                      isComplete: value!),
                                  index);
                            },
                          ),
                          title: Text(todoList[index].title),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  controller.text = todoList[index].title;
                                  TodoDialogUtil.showTodoDialog(
                                    context,
                                    controller,
                                    isEdit: true,
                                    onPressed: () {
                                      todoNotifier.updateTask(
                                          TodoModel(
                                              title: controller.text,
                                              isComplete:
                                                  todoList[index].isComplete),
                                          index);
                                      controller.clear();
                                      Navigator.pop(context);
                                    },
                                  );
                                },
                                icon: const Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () {
                                  todoNotifier.deleteTask(index);
                                },
                                icon: const Icon(Icons.delete),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
          }),
    );
  }
}
