import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 

class AddToDoListScreen extends StatefulWidget {
  const AddToDoListScreen({super.key});

  @override
  _AddToDoListScreenState createState() => _AddToDoListScreenState();
}

class _AddToDoListScreenState extends State<AddToDoListScreen> {
  bool _isPrivate = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const TextField(decoration: InputDecoration(labelText: 'Description')),
              const SizedBox(height: 20),
              const Text('Frequency'),
              const SizedBox(height: 10),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Private To-do?'),
                  Switch(
                    value: _isPrivate,
                    onChanged: (value) {
                      setState(() {
                        _isPrivate = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    var Fluttertoast;
                    Fluttertoast.showToast(msg: "Task completed");
                  }
                },
                child: const Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}