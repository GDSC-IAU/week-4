import 'package:flutter/material.dart';
import 'package:todo_list/screens/account.dart';

class AccountButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AccountScreen()),
        );
      },
      child: Image.asset('lib/assets/images/account.png',
      width: 100,
      height: 100,),
    );
  }
}
