import 'package:flutter/material.dart';

class TodoDialogUtil {
  static showTodoDialog(
    BuildContext context,
    TextEditingController controller, {
    bool isEdit = false,
    required VoidCallback onPressed,
  }) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isEdit ? "Update Todo" : "Add Todo"),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            label: Text("Todo Task"),
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[700],
            ),
            child: Text(isEdit ? "Update" : "Add"),
          )
        ],
      ),
    );
  }
}
