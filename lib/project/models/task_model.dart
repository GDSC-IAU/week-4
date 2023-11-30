import 'package:flutter/material.dart';

class Task {
  String taskName;
  String taskDescription;
  TimeOfDay dueTime;
  bool isCompleted;

  Task({
    required this.taskName,
    required this.dueTime,
    this.taskDescription = "",
    this.isCompleted = false,
  });
}
