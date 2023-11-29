import 'package:flutter/material.dart';
import 'package:todo_list/project/models/task_model.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> tasks = [
    Task(
      taskName: 'View Task App',
      dueTime: const TimeOfDay(hour: 23, minute: 59),
    ),
    Task(
      taskName: 'Read a book',
      dueTime: const TimeOfDay(hour: 19, minute: 30),
    ),
    Task(
      taskName: 'Study Physics',
      dueTime: const TimeOfDay(hour: 15, minute: 59),
    ),
  ];
  Task? selectedTask;

  void addTask(Task task) {
    tasks.add(task);
    notifyListeners();
  }

  void refresh() {
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
}
