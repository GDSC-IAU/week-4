// todo.dart

class Todo1 {
  final String id;
  String title;
  bool isCompleted;

  Todo1({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });
}
