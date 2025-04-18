import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddMemberScreen extends StatelessWidget {
  const AddMemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _parentPhoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();
  final TextEditingController _officeController = TextEditingController();
  final TextEditingController _jobPositionController = TextEditingController();
  final TextEditingController _bloodGroupController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Add Member"),
            Text('9:41'),
          ],
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    // Profile picture
                    Container(
                      width: 120,
                      height: 120,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: const Icon(Icons.person, size: 50),
                    ),
                    // Edit Button
                   IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit),
                        color: Colors.blue,
                      ),
                  ],
                ),
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
                    return 'Please enter the name';
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
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the phone number';
                  }
                  if (value.length < 8) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _parentPhoneController,
                decoration: const InputDecoration(
                  labelText: 'Parent Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _parentPhoneController,
                decoration: const InputDecoration(
                  labelText: 'Parent Relationship',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _occupationController,
                decoration: const InputDecoration(
                  labelText: 'Occupation',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _officeController,
                decoration: const InputDecoration(
                  labelText: 'Office',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _jobPositionController,
                decoration: const InputDecoration(
                  labelText: 'Job Position',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _bloodGroupController,
                decoration: const InputDecoration(
                  labelText: 'Blood Group',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Member saved')),
            );
          }
        },
        child: const Icon(Icons.save),
      ),
    );
  }
  }
