import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/splash_screen.dart';
import './screens/TaskScreen.dart';

import './provider/DarkModeProvider.dart';
import './screens/TaskScreen.dart';
import 'provider/TodoProvider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DarkModeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MaterialApp(
          title: 'Todo List App',
          theme: ThemeData.light(), 
          darkTheme: ThemeData.dark(), 
          themeMode: Provider.of<DarkModeProvider>(context).isDarkMode
              ? ThemeMode.dark
              : ThemeMode.light,
          home: SplashScreen(), 
          routes: {
            '/home': (context) => TaskScreen(),
          }
          ),
    );
  }
}
