import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/todo.dart';
import 'package:todo_list/providers/todo_provider.dart';
import 'package:todo_list/screens/add_todo_screen.dart';
import 'package:todo_list/screens/edit_todo_screen.dart';
import 'package:todo_list/screens/home_screen.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TodoProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo App',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/add_todo': (context) => const AddTodoScreen(),
          '/edit_todo': (context) => EditTodoScreen(todo: Todo(
            id: '1',
            title: 'Update Task',
            description: 'This is the updated task.',
         ) 
        )
        },
      ),
    );
  }
}