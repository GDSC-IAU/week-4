import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/providers/days_provider.dart';

import 'screens/home_page.dart';

import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => DaysProvider(day: DateTime.now()),
      child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const HomePage(),
    );
  }
}
