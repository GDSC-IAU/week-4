import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './account_button.dart';

class User extends StatelessWidget {
  const User({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(


      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20.0), 

      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AccountButton(),
          ),
          Text(
            'Welcome',
            textAlign: TextAlign.left,
            style: GoogleFonts.lato(
              color: Colors.white, 
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
