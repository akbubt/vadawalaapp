import 'package:flutter/material.dart'; 

class SendMessageScreen extends StatefulWidget {
  const SendMessageScreen({super.key});

  @override
  _SendMessageScreenState createState() => _SendMessageScreenState();
}

class _SendMessageScreenState extends State<SendMessageScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _messageController = TextEditingController();
  final List<String> _roomMembers = [
    'Member 1',
    'Member 2',
    'Member 3',
    'Member 4',
  ];
  String? _selectedMember;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Send Message'),
            Text('9:41'),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<String>(
                value: _selectedMember,
                hint: const Text('Select Member'),
                items: _roomMembers
                    .map((member) => DropdownMenuItem<String>(
                          value: member,
                          child: Text(member),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedMember = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a member';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _messageController,
                decoration: const InputDecoration(
                  labelText: 'Message',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a message';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Show toast message
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Message sent')),
                      );
                    }
                  },
                  child: const Text('Send Message'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}