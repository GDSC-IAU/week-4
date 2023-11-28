class Task {
  String taskName;
  String taskDescription;
  bool isCompleted;

  Task({
    required this.taskName,
    this.taskDescription = "",
    this.isCompleted = false,
  });
}
