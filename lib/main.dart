import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/project/constants/colors.dart';
import 'package:todo_list/project/providers/tasks_provider.dart';
import 'package:todo_list/project/screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TaskProvider(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: theme.copyWith(
        primaryColor: AppColors.primiaryColor,
        colorScheme: theme.colorScheme.copyWith(
          secondary: AppColors.secondaryColor,
        ),
      ),
    );
  }
}
