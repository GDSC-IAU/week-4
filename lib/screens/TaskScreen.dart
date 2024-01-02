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
      title: Center(
        child: Text(
          'Todo List',
          style: GoogleFonts.lato(
            color: Colors.black,
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
        Expanded(
          child: buildTodoList(),
        ),
      ],
    );
  }

  Widget buildTodoList() {
    return Consumer<TodoProvider>(
      builder: (context, todoProvider, _) {
        return ListView.builder(
          itemCount: todoProvider.todos.length,
          itemBuilder: (context, index) {
            final todo = todoProvider.todos[index];
            return Container(
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TaskListItem(
                todo: Todo1(
                  id: todo.id,
                  title: todo.title,
                  isCompleted: todo.isCompleted,
                ),
              ),
            );
          },
        );
      },
    );
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
      builder: (context) => AddTaskDialog(),
    );
  }
}
