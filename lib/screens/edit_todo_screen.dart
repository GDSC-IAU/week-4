// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/todo.dart';
import 'package:todo_list/providers/todo_provider.dart';

class EditTodoScreen extends StatefulWidget {
  final Todo todo;
    const EditTodoScreen({super.key, required this.todo});

  @override
  _EditTodoScreenState createState() => _EditTodoScreenState();
}

class _EditTodoScreenState extends State<EditTodoScreen> {
  late TextEditingController _titleController;
  late bool _isCompleted;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.todo.title);
    _isCompleted = widget.todo.isCompleted;
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _updateTodo() {
    final title = _titleController.text.trim();

    if (title.isNotEmpty) {
      final todoProvider = Provider.of<TodoProvider>(context, listen: false);
      todoProvider.updateTodoTitle(widget.todo.id, title);
      todoProvider.updateTodoStatus(widget.todo.id, _isCompleted);

      Navigator.pop(context);
    }
  }

  void _deleteTodo() {
    final todoProvider = Provider.of<TodoProvider>(context, listen: false);
    todoProvider.deleteTodoById(widget.todo.id);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Todo'),
        backgroundColor: const Color.fromARGB(255, 242, 157, 186)
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
            CheckboxListTile(
              title: const Text('Completed'),
              value: _isCompleted,
              onChanged: (value) {
                setState(() {
                  _isCompleted = value!;
                });
              },
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _updateTodo,
                    child: const Text('Update'),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _deleteTodo,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text('Delete'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}