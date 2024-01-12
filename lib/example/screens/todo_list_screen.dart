import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/example/models/todo_model.dart';
import 'package:todo_list/example/providers/todo_provider.dart';



class TodoListScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todo List',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue[100]!,
              Colors.blue[300]!,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Tasks',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12.0),
              Expanded(
                child: Column(
                  children: [
                    _buildTaskList(context, false),
                    const SizedBox(height: 16.0),
                    _buildTaskList(context, true),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              _buildAddTaskInput(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTaskList(BuildContext context, bool completed) {
    final provider = Provider.of<TodoProvider>(context);
    final tasks = provider.todos.where((task) => task.isCompleted == completed).toList();

    return tasks.isEmpty
        ? Container()
        : Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  completed ? 'Complete' : 'Incomplete',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                const SizedBox(height: 8.0),
                Column(
                  children: tasks.map((task) {
                    return ListTile(
                      leading: Checkbox(
                        value: task.isCompleted,
                        onChanged: (value) {
                          provider.updateTodoStatus(task.id, value ?? false);
                        },
                        activeColor: Colors.blueAccent,
                      ),
                      title: Text(
                        task.title,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black87,
                          decoration:
                              task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.blueAccent),
                        onPressed: () {
                          provider.deleteTodo(task.id);
                        },
                      ),
                      onTap: () => _showEditTodoDialog(context, task),
                    );
                  }).toList(),
                ),
              ],
            ),
          );
  }

  Widget _buildAddTaskInput(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Enter a new task...',
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8.0),
            IconButton(
              icon: const Icon(
                Icons.add,
                color: Colors.blueAccent,
              ),
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  Provider.of<TodoProvider>(context, listen: false).addTodo(_controller.text);
                  _controller.clear();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showEditTodoDialog(BuildContext context, Todo todo) {
    final TextEditingController editController =
        TextEditingController(text: todo.title);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Task'),
          content: TextField(
            controller: editController,
            style: const TextStyle(color: Colors.black),
            decoration: const InputDecoration(
              labelText: 'New Task',
              labelStyle: TextStyle(color: Colors.blueAccent),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            TextButton(
              onPressed: () {
                Provider.of<TodoProvider>(context, listen: false)
                    .updateTodoTitle(todo.id, editController.text);
                Navigator.of(context).pop();
              },
              child: const Text(
                'Save',
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
          ],
        );
      },
    );
  }
}
