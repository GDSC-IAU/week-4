import 'package:todo_list/models/task.dart';

class Day {
  DateTime date;
  List<Task> tasks = [];

  Day({required this.date});

  void addTask(Task task) {
    tasks.add(task);
  }

  void deleteTask(Task task) {
    tasks.remove(task);
  }
}
