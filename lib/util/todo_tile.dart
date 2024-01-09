import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/task_model.dart';
import 'package:todo_list/provider/task_provider.dart';

class todo_tile extends StatelessWidget {
  final task Task; // make accept a task obj instad of a title
//  Function(bool?)? onChange;

  todo_tile({
    super.key,
    required this.Task,
    // required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color.fromARGB(255, 159, 159, 159))),
      child: Center(
          child: Row(children: [
        Checkbox(
          value: Task.isDone,
          onChanged: (value) {
            Provider.of<TaskProvider>(context, listen: false)
                .updateTaskStatus(Task, value ?? false);
          },
        ),
        Text(
          Task.taskTitle,
          style: TextStyle(
              decoration: Task.isDone
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
        ),
        Spacer(),
        Consumer<TaskProvider>(builder: (context, taskProvider, child) {
          return IconButton(
              onPressed: () {
                taskProvider.edit(context, Task.taskTitle);
              },
              icon: Icon(Icons.edit));
        }),
        Consumer<TaskProvider>(builder: (context, taskProvider, child) {
          return IconButton(
              onPressed: () {
                taskProvider.delete(Task.taskTitle);
              },
              icon: Icon(Icons.delete));
        })
      ])),
    );
  }
}
