import 'package:flutter/material.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Business Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Hostel Name',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('Phone: +1234567890'),
            const SizedBox(height: 20),
            const Text('Features:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            // Example Feature Icons
            Row(
              children: const [
                Icon(Icons.wifi),
                SizedBox(width: 8),
                Icon(Icons.local_parking),
                SizedBox(width: 8),
                Icon(Icons.security),
              ],
            ),
            const SizedBox(height: 20),
            const Text('Location:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            // Map Placeholder
            Container(
              height: 150,
              color: Colors.grey[300],
              child: const Center(child: Text('Map')),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to Detailed Information Screen
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const DetailedInformationScreen()));
              },
              child: const Text('View More Details'),
            ),
          ],
        ),
      ),
    );
  }
}

// Information Screen (Detailed)
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
          children: const [
            Text('Hostel Name',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Phone: +1234567890'),
            SizedBox(height: 10),
            Text('Total Rooms: 10'),
            SizedBox(height: 10),
            Text('Total People: 50'),
          ],
        ),
      ),
    );
  }
}