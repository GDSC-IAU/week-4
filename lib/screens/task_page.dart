import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/helpers/constants.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/providers/days_provider.dart';

class TaskPage extends StatefulWidget {
  final Task task;
  const TaskPage({Key? key, required this.task}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final TextEditingController myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    myController.text = widget.task.title;
    return Consumer<DaysProvider>(builder: (context, daysProvider, child) {
      return Scaffold(
          appBar: AppBar(
            title: Text(widget.task.title),
            backgroundColor: const Color.fromRGBO(78, 90, 232, 1),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: myController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Constants.h16,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(78, 90, 232, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {
                      daysProvider.updateTask(widget.task, myController.text);
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text('Update', style: TextStyle(fontSize: 20)),
                    ),
                  )
                ],
              ),
            ),
          ));
    });
  }
}
