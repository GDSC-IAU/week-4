import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/example/providers/todo_provider.dart';
import 'package:todo_list/example/screens/todo_list_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MaterialApp(
        title: 'Todo List App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: TodoListScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
   