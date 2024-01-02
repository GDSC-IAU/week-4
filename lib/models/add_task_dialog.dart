import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/TodoProvider.dart';

class AddTaskDialog extends StatelessWidget {
  const AddTaskDialog({super.key});

  @override
  Widget build(BuildContext context) {
    String newTaskTitle = '';

    return AlertDialog(
      title: const Text('Add a New Task'),
      content: TextField(
        onChanged: (value) {
          newTaskTitle = value;
          
        },
      ),


      actions: [
        TextButton(
          onPressed: () {
            Provider.of<TodoProvider>(context, listen: false).addTodo(newTaskTitle);
            Navigator.of(context).pop();
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
