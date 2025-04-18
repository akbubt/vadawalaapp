import 'package:flutter/material.dart';
import 'package:myapp/room_management/room_list_screen.dart';
import 'package:myapp/select_business_type_screen.dart'; 

// Enter Information Form
class EnterInformationForm extends StatefulWidget {
  const EnterInformationForm({super.key});

  @override
  State<EnterInformationForm> createState() => _EnterInformationFormState();
}

class _EnterInformationFormState extends State<EnterInformationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            const SelectBusinessTypeScreen()),
                      ),
                      icon: const Icon(Icons.arrow_back)),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RoomListScreen()),
                        );
                      },
                      child: const Text("Skip")),
                ],
              ),
              const Text('9:41'),
              const SizedBox(height: 20),
              const Text(
                "Please enter your information...",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text("Add Image"),
              // Placeholder for Image Upload
              Container(
                height: 100,
                color: Colors.grey[300],
                alignment: Alignment.center,
                child: const Icon(Icons.add_a_photo, size: 40),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone';
                  }
                  // Basic phone number validation
                  if (value.length < 8) {
                    return 'Phone number must be at least 8 digits';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RoomListScreen()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Continue'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'Fee',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_down),
            label: 'Expense',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: 'Task',
          ),
        ],
      ),
    );
  }
}