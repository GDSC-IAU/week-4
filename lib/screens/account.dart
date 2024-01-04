import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../provider/DarkModeProvider.dart';
import './widgets/user_widget.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text(
            'Todo List',
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: User(),
            ),
          ),
          buildSettingsSection(context),
        ],
      ),
    );
  }

  Widget buildSettingsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          buildSectionTitle('Settings'),
          buildDarkModeSwitch(context),
        ],
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Center(
      child: Text(
        title,
        style: GoogleFonts.lato(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildDarkModeSwitch(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Dark Mode'),
          Switch(
            value: Provider.of<DarkModeProvider>(context).isDarkMode,
            onChanged: (value) {
              Provider.of<DarkModeProvider>(context, listen: false).toggleDarkMode();
            },
          ),
        ],
      ),
    );
  }
}
