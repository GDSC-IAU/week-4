import 'package:flutter/material.dart';
import 'package:todo_list/project/constants/colors.dart';
import 'package:todo_list/project/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: ThemeData(primaryColor: AppColors.primiaryColor),
    );
  }
}
