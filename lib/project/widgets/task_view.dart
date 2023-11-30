import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/project/functions.dart';
import 'package:todo_list/project/models/task_model.dart';
import 'package:todo_list/project/providers/tasks_provider.dart';

class TaskView extends StatelessWidget {
  final Task task;

  const TaskView({
    required this.task,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TaskProvider taskProvider =
        Provider.of<TaskProvider>(context, listen: false);

    const boxDecoration = BoxDecoration(
      border: Border(
        bottom: BorderSide(
          width: 1,
          color: Color.fromARGB(255, 238, 240, 245),
        ),
      ),
    );

    return Container(
      decoration: boxDecoration,
      child: ListTile(
        title: Text(
          task.taskName,
          style: TextStyle(
            decoration: task.isCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            decorationThickness: 2,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        subtitle: Text(
          'Due at ${timeDayString(task.dueTime)}',
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () => Navigator.pushNamed(
                context,
                '/modify',
                arguments: [onSubmit, task],
              ),
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {
                taskProvider.deleteTask(task);
              },
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
        leading: Transform.scale(
          scale: 1.3,
          child: Checkbox(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            value: task.isCompleted,
            onChanged: (bool? isCompleted) {
              task.isCompleted = isCompleted!;
              taskProvider.refresh();
            },
          ),
        ),
      ),
    );
  }

  void onSubmit(
    BuildContext context,
    String title,
    String description,
    TimeOfDay time,
  ) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);

    task.dueTime = time;
    task.taskName = title;
    task.taskDescription = description;

    taskProvider.refresh();
    Navigator.maybePop(context);
  }
}
