import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/project/constants/colors.dart';
import 'package:todo_list/project/providers/tasks_provider.dart';
import 'package:todo_list/project/screens/manage_task_screen.dart';
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

  Widget createManageScreen({
    required BuildContext context,
    required String buttonLabel,
    required String appBarTitle,
  }) {
    final arguments = ModalRoute.of(context)!.settings.arguments as List;
    return ManageTaskScreen(
      callback: arguments[0],
      appBarTitle: appBarTitle,
      buttonLabel: buttonLabel,
      task: arguments.length > 1 ? arguments[1] : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getTheme(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/create': (context) => createManageScreen(
            context: context,
            buttonLabel: 'Create',
            appBarTitle: 'Create a task'),
        '/modify': (context) => createManageScreen(
            context: context,
            buttonLabel: 'Update',
            appBarTitle: 'Modify a task'),
      },
    );
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
