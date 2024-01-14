import 'package:flutter/foundation.dart';
import 'package:todo_list/models/todo.dart';

class TodoProvider extends ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void updateTodoStatus(String id, bool isCompleted) {
    final todoIndex = _todos.indexWhere((todo) => todo.id == id);
    if (todoIndex >= 0) {
      _todos[todoIndex].isCompleted = isCompleted;
      notifyListeners();
    }
  }

  void updateTodoTitle(String id, String newTitle) {
    final todoIndex = _todos.indexWhere((todo) => todo.id == id);
    if (todoIndex >= 0) {
      _todos[todoIndex].title = newTitle;
      notifyListeners();
    }
  }

  void deleteTodoById(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }
}