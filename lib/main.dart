import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/project/constants/colors.dart';
import 'package:todo_list/project/providers/tasks_provider.dart';
import 'package:todo_list/project/screens/create_task_screen.dart';
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
    return MaterialApp(
        theme: getTheme(),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/create': (context) => const CreateTaskScreen(),
        });
  }

  ThemeData getTheme() {
    final ThemeData theme = ThemeData();
    return theme.copyWith(
      primaryColor: AppColors.primiaryColor,
      scaffoldBackgroundColor: AppColors.scaffoldBackground,
      appBarTheme: theme.appBarTheme.copyWith(
        centerTitle: true,
        elevation: 0,
        foregroundColor: AppColors.primiaryColor,
        backgroundColor: AppColors.scaffoldBackground,
      ),
      colorScheme: theme.colorScheme.copyWith(
        secondary: AppColors.secondaryColor,
      ),
    );
  }
}
