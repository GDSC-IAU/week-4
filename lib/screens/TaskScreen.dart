import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../provider/TodoProvider.dart';
import './widgets/task_list_item.dart';
import './widgets/account_button.dart';
import '../models/todo1.dart';
import '../models/add_task_dialog.dart';
import './widgets/user_widget.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
      floatingActionButton: buildFloatingActionButton(context),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.blue,
      title: Center(
        child: Text(
          'Todo List',
          style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: User(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: Text(
              'Your Tasks:',
              style: GoogleFonts.lato(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          child: buildTodoList(),
        ),
      ],
    );
  }

  Widget buildTodoList() {
    return Consumer<TodoProvider>(
      builder: (context, todoProvider, _) {
        final todos = todoProvider.todos;

        // Sort completed tasks to the bottom
        todos.sort((a, b) => a.isCompleted == b.isCompleted ? 0 : a.isCompleted ? 1 : -1);

        return ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            final todo = todos[index];

            return GestureDetector(
              onDoubleTap: () {
                return 

               _editTodoTitle(context, todo.id, 'New Title'); // todo double tap to edit title
              },

            
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: todo.isCompleted ? Color.fromARGB(255, 4, 50, 88) : const Color.fromARGB(255, 148, 201, 245),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TaskListItem(
                  todo: Todo1(
                    id: todo.id,
                    title: todo.title,
                    isCompleted: todo.isCompleted,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

void _editTodoTitle(BuildContext context, String todoId, String newTitle) {
  Provider.of<TodoProvider>(context, listen: false).updateTodoTitle(todoId, newTitle);
}

  FloatingActionButton buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showAddTaskDialog(context),
      backgroundColor: Colors.blue,
      child: const Icon(Icons.add),
    );
  }

  void showAddTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AddTaskDialog(),
    );
  }
}
