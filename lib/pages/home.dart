import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/provider/task_provider.dart';
import 'package:todo_list/util/todo_tile.dart';
import 'package:todo_list/models/task_model.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TaskProvider taskProvider = Provider.of<TaskProvider>(context);
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 245, 245, 246),
        appBar: AppBar(
            title: const Text('ToDoApp',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            centerTitle: true,
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            leading: Icon(Icons.menu)),
        body: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: 40, left: 20, right: 20),
                width: 400,
                height: 40,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textFieldController,
                        decoration: InputDecoration(
                            hintText: 'add new tasks',
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.all(12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 68, 68, 68)),
                        onPressed: () {
                          String taskTitle = _textFieldController.text;
                          if (taskTitle.isNotEmpty) {
                            taskProvider.addTask(taskTitle); //add task
                            _textFieldController.clear();
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                        content:
                                            Text('Plase enter a task title.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text('OK'),
                                          )
                                        ]));
                          }
                          _textFieldController.clear();
                        },
                        child: const Text(
                          '+',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ))
                  ],
                )),
            Container(
                padding: EdgeInsets.all(15),
                child: const Row(
                  children: [
                    Text(
                      'My tasks',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    )
                  ],
                )),
            Center(
                child: Visibility(
              visible: taskProvider.allTasks.isEmpty,
              child: const Text('You haven\t added any tasks yet'),
            )),
            Expanded(
              child: Consumer<TaskProvider>(
                builder: (context, TaskProvider, child) {
                  return ListView.builder(
                      itemCount: taskProvider.allTasks.length,
                      itemBuilder: (context, index) {
                        task Task = taskProvider.allTasks[index];
                        return todo_tile(
                          Task: Task,
                        );
                      });
                },
              ),
            )
          ],
        ));
  }
}
