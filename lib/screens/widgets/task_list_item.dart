import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_list/provider/TodoProvider.dart';
import '../../models/todo1.dart' as todo_model; // Use 'as' to create a prefix

class TaskListItem extends StatelessWidget {
  final todo_model.Todo1 todo; // Use the prefix to specify which Todo class to use

  TaskListItem({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context, listen: false);

    return ListTile(
      title: Text(
        todo.title,
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: Checkbox(
        value: todo.isCompleted,
        onChanged: (value) {
          todoProvider.updateTodoStatus(todo.id, value!);
        },
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete, color: Colors.red),
        onPressed: () {
          todoProvider.deleteTodo(todo.id);
        },
      ),
      onTap: () {
        // Handle onTap if needed
      },
    );
  }
}
