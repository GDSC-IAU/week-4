import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/pages/home.dart';
import 'package:todo_list/provider/task_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TaskProvider(),
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}
