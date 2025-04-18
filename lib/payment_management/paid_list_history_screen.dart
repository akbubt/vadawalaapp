import 'package:flutter/material.dart';

class PaidListHistoryScreen extends StatelessWidget {
  const PaidListHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(""),
            Text('9:41'),
          ],
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: const Center(
        child: Text("Paid List History Screen"),
      ),
    );
  }
}