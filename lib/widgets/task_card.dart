import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/providers/days_provider.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  const TaskCard({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    Icon icon = Icon(
      task.isDone ? Icons.check_circle : Icons.radio_button_unchecked,
      color: Colors.white,
    );
    return Consumer<DaysProvider>(
      builder: (context, daysProvider, child) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  daysProvider.toggleTask(task);
                },
                icon: icon,
              ),
              Text(
                task.title,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        );
      },
    );
  }
}
