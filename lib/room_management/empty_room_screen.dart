import 'package:flutter/material.dart';
import 'add_room_screen.dart';

// Empty Room Screen
class EmptyRoomScreen extends StatelessWidget {
  const EmptyRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Add Rooms",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text("Add rooms to get started."),
            const SizedBox(height: 20),
            FloatingActionButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddRoomScreen()),
                );
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}