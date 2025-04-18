import 'package:flutter/material.dart';

class DetailedInformationScreen extends StatelessWidget {
  const DetailedInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detailed Business Information'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Hostel Name', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('Phone: +1234567890'),
            const SizedBox(height: 10),
            const Text('Total Rooms: 10'),
            const SizedBox(height: 10),
            const Text('Total People: 50'),
          ],
        ),
      ),
    );
  }
}