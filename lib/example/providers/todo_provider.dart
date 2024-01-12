import 'package:flutter/foundation.dart';
import 'package:todo_list/example/models/todo_model.dart';
import 'package:uuid/uuid.dart';


class TodoProvider extends ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos => List.unmodifiable(_todos);

  void addTodo(String title) {
    final newTodo = Todo(
      id: const Uuid().v4(),
      title: title,
      isCompleted: false,
    );
    _todos.add(newTodo);
    notifyListeners();
  }

  void updateTodoStatus(String id, bool isCompleted) {
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      _todos[index] = _todos[index].copyWith(isCompleted: isCompleted);
      notifyListeners();
    }
  }

  void updateTodoTitle(String id, String newTitle) {
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      _todos[index] = _todos[index].copyWith(title: newTitle);
      notifyListeners();
    }
  }

  void deleteTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }
}
