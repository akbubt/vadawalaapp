import 'package:flutter/material.dart';
import '../room_management/room_list_screen.dart';

class AddRoomScreen extends StatelessWidget {
  const AddRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.door_front_door, size: 30),
              Text("9:41"),
            ],
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text("Room Name"),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Enter Room Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a room name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text("Beds"),
                const SizedBox(height: 10),
                DropdownButtonFormField<int>(
                  items: List.generate(7, (index) => index + 1)
                      .map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text('$value'),
                    );
                  }).toList(),
                  onChanged: (int? newValue) {},
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select the number of beds';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RoomListScreen()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Colors.blue),
                  child: const Text('Save',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}