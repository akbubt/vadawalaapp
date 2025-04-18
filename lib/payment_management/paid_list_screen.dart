import 'package:flutter/material.dart';

class PaidListScreen extends StatelessWidget {
  const PaidListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Text(
          "You currently have no one in the list",
          style: TextStyle(fontSize: 18),
        ),
      ]),
    );
  }
}