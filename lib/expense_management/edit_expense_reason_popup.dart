import 'package:flutter/material.dart';

class EditExpenseReasonPopup extends StatelessWidget {
  const EditExpenseReasonPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text('Edit Expense'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              child: const Icon(Icons.person, size: 30),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Expense',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the expense';
                }
                return null;
              },
            ),
             const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the amount';
                }
                if (double.tryParse(value) == null) {
                  return 'Please enter a valid number';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
             TextFormField(
              decoration: const InputDecoration(
                labelText: 'Reason',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a reason';
                }
                return null;
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel', style: TextStyle(color: Colors.red)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Update'),
          ),
        ]);
  }
}