import 'package:flutter/material.dart';
import 'package:todo_list/models/day.dart';
import 'package:todo_list/models/task.dart';

class DaysProvider extends ChangeNotifier {
  List<Day> _days = [];

  List<Day> get days => _days;

  DaysProvider({required DateTime day})
      : _days = [
          Day(date: day.subtract(const Duration(days: 2))),
          Day(date: day.subtract(const Duration(days: 1))),
          Day(date: day),
          Day(date: day.add(const Duration(days: 1))),
          Day(date: day.add(const Duration(days: 2))),
          Day(date: day.add(const Duration(days: 3))),
          Day(date: day.add(const Duration(days: 4))),
          Day(date: day.add(const Duration(days: 5))),
          Day(date: day.add(const Duration(days: 6))),
          Day(date: day.add(const Duration(days: 7))),
        ];

  void addTask(Task task, Day day) {
    day.tasks.add(task);
    notifyListeners();
  }

  void toggleTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task, Day day) {
    day.tasks.remove(task);
    notifyListeners();
  }

  void updateTask(Task task, String title) {
    task.title = title;
    notifyListeners();
  }
}
