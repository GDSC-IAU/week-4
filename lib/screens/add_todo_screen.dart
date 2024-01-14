// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/todo.dart';
import 'package:todo_list/providers/todo_provider.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _addTodo() {
    final title = _titleController.text.trim();

    if (title.isNotEmpty) {
      final todoProvider = Provider.of<TodoProvider>(context, listen: false);
      final todo = Todo(
        id: DateTime.now().toString(),
        title: title, description: '',
      );
      todoProvider.addTodo(todo);

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
        backgroundColor: const Color.fromARGB(255, 242, 157, 186),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            const SizedBox(height: 16.0 ),
            ElevatedButton(
              onPressed: _addTodo,
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}