import 'package:flutter/material.dart';

class DetailBox extends StatelessWidget {
  final CrossAxisAlignment crossAxisAlignment;
  final String title;
  final int counter;
  const DetailBox({
    required this.title,
    required this.counter,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          counter.toString().padLeft(2, '0'),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
