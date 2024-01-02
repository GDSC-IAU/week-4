import 'package:flutter/material.dart';


class account extends StatelessWidget {
  const account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Screen'),
      ),

      
      body: const Center(
        child: Text('This is the account screen!'),
      ),
    );
  }
}