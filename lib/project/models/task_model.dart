class Task {
  String taskName;
  String taskDescription;
  DateTime dueDate;
  bool isCompleted;

  Task({
    required this.taskName,
    required this.dueDate,
    this.taskDescription = "",
    this.isCompleted = false,
  });
}
