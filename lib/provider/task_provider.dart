import 'package:flutter/material.dart';
import 'package:todo_list/models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<task> allTasks = [];

  //adding tasks to allTasks list
  void addTask(String taskTitle) {
    task newTask = task(taskTitle: taskTitle, isDone: false);
    allTasks.add(newTask);
    notifyListeners();
  }

  //edit a task
  void edit(BuildContext context, String currentTaskTitle) {
    TextEditingController _editTextFieldController = TextEditingController();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Edit Task'),
            content: TextField(
              controller: _editTextFieldController,
              decoration: InputDecoration(hintText: 'Enter new task title'),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              TextButton(
                  onPressed: () {
                    String newTaskTitle = _editTextFieldController.text;
                    editTask(currentTaskTitle, newTaskTitle);
                    Navigator.pop(context);
                  },
                  child: Text('Save'))
            ],
          );
        });
  }

  //delete a task i think i need a task id?
  void delete(String taskTitle) {
    allTasks.removeWhere((task) => task.taskTitle == taskTitle);
    notifyListeners();
  }

  void editTask(String currentTaskTitle, String newTaskTitle) {
    int index =
        allTasks.indexWhere((task) => task.taskTitle == currentTaskTitle);

    if (index != -1) {
      allTasks[index] = task(taskTitle: newTaskTitle, isDone: false);
      notifyListeners();
    }
  }

  void updateTaskStatus(task Task, bool value) {
    int index = allTasks.indexOf(Task);
    if (index != -1) {
      allTasks[index].isDone = value;
      notifyListeners();
    }
  }
}
